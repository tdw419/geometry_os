; DESCRIPTION: Draws a blue line from (415, 31) to (118, 11).
; PLAN: r0=415(x1), r1=31(y1), r2=118(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 31
LDI r2, 118
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
