; DESCRIPTION: Draws a green line from (94, 129) to (254, 53).
; PLAN: r0=94(x1), r1=129(y1), r2=254(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 129
LDI r2, 254
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
