; DESCRIPTION: Renders a blue line between points (185, 85) and (173, 202).
; PLAN: r0=185(x1), r1=85(y1), r2=173(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 85
LDI r2, 173
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
