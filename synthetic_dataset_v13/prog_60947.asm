; DESCRIPTION: Draws a magenta line from (415, 142) to (476, 0).
; PLAN: r0=415(x1), r1=142(y1), r2=476(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 142
LDI r2, 476
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
