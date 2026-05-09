; DESCRIPTION: Renders a blue line between points (79, 235) and (428, 255).
; PLAN: r0=79(x1), r1=235(y1), r2=428(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 235
LDI r2, 428
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
