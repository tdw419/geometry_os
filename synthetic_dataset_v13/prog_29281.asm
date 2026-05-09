; DESCRIPTION: Renders a blue line between points (222, 79) and (226, 154).
; PLAN: r0=222(x1), r1=79(y1), r2=226(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 79
LDI r2, 226
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
