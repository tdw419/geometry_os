; DESCRIPTION: Places a red line segment connecting (322, 230) to (420, 151).
; PLAN: r0=322(x1), r1=230(y1), r2=420(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 230
LDI r2, 420
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
