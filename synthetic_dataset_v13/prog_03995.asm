; DESCRIPTION: Draws a white line from (94, 129) to (13, 5).
; PLAN: r0=94(x1), r1=129(y1), r2=13(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 129
LDI r2, 13
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
