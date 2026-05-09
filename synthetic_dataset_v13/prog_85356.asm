; DESCRIPTION: Places a red line segment connecting (412, 255) to (136, 103).
; PLAN: r0=412(x1), r1=255(y1), r2=136(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 255
LDI r2, 136
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
