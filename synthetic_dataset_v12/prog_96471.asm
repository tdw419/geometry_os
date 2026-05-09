; DESCRIPTION: Renders a orange line between points (196, 161) and (39, 55).
; PLAN: r0=196(x1), r1=161(y1), r2=39(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 161
LDI r2, 39
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
