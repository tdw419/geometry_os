; DESCRIPTION: Renders a blue line between points (251, 220) and (495, 236).
; PLAN: r0=251(x1), r1=220(y1), r2=495(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 220
LDI r2, 495
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
