; DESCRIPTION: Renders a orange line between points (435, 14) and (401, 23).
; PLAN: r0=435(x1), r1=14(y1), r2=401(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 14
LDI r2, 401
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
