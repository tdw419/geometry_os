; DESCRIPTION: Renders a orange line between points (327, 22) and (395, 205).
; PLAN: r0=327(x1), r1=22(y1), r2=395(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 22
LDI r2, 395
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
