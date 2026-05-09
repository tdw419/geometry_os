; DESCRIPTION: Renders a orange line between points (420, 81) and (143, 237).
; PLAN: r0=420(x1), r1=81(y1), r2=143(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 81
LDI r2, 143
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
