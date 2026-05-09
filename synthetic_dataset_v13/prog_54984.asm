; DESCRIPTION: Places a red line segment connecting (32, 116) to (249, 153).
; PLAN: r0=32(x1), r1=116(y1), r2=249(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 116
LDI r2, 249
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
