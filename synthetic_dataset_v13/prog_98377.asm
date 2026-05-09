; DESCRIPTION: Renders a orange line between points (22, 31) and (480, 37).
; PLAN: r0=22(x1), r1=31(y1), r2=480(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 31
LDI r2, 480
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
