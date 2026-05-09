; DESCRIPTION: Draws a blue line from (6, 104) to (415, 180).
; PLAN: r0=6(x1), r1=104(y1), r2=415(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 104
LDI r2, 415
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
