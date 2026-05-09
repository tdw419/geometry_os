; DESCRIPTION: Renders a orange line between points (412, 23) and (175, 205).
; PLAN: r0=412(x1), r1=23(y1), r2=175(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 23
LDI r2, 175
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
