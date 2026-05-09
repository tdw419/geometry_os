; DESCRIPTION: Renders a orange line between points (185, 16) and (233, 115).
; PLAN: r0=185(x1), r1=16(y1), r2=233(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 16
LDI r2, 233
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
