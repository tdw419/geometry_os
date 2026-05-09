; DESCRIPTION: Renders a blue line between points (173, 79) and (145, 250).
; PLAN: r0=173(x1), r1=79(y1), r2=145(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 79
LDI r2, 145
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
