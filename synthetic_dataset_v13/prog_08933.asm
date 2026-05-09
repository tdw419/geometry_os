; DESCRIPTION: Draws a black line from (30, 129) to (335, 123).
; PLAN: r0=30(x1), r1=129(y1), r2=335(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 129
LDI r2, 335
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
