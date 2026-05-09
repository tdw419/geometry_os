; DESCRIPTION: Renders a blue line between points (172, 157) and (338, 40).
; PLAN: r0=172(x1), r1=157(y1), r2=338(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 157
LDI r2, 338
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
