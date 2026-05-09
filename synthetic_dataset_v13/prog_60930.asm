; DESCRIPTION: Draws a blue line from (415, 96) to (24, 61).
; PLAN: r0=415(x1), r1=96(y1), r2=24(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 96
LDI r2, 24
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
