; DESCRIPTION: Places a red line segment connecting (246, 234) to (234, 151).
; PLAN: r0=246(x1), r1=234(y1), r2=234(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 234
LDI r2, 234
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
