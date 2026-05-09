; DESCRIPTION: Places a red line segment connecting (249, 166) to (16, 116).
; PLAN: r0=249(x1), r1=166(y1), r2=16(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 166
LDI r2, 16
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
