; DESCRIPTION: Renders a blue line between points (48, 79) and (107, 17).
; PLAN: r0=48(x1), r1=79(y1), r2=107(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 79
LDI r2, 107
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
