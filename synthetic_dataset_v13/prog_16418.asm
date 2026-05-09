; DESCRIPTION: Places a green line segment connecting (323, 133) to (305, 151).
; PLAN: r0=323(x1), r1=133(y1), r2=305(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 133
LDI r2, 305
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
