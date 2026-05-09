; DESCRIPTION: Places a red line segment connecting (32, 155) to (415, 115).
; PLAN: r0=32(x1), r1=155(y1), r2=415(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 155
LDI r2, 415
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
