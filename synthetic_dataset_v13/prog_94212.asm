; DESCRIPTION: Places a white line segment connecting (82, 60) to (407, 151).
; PLAN: r0=82(x1), r1=60(y1), r2=407(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 60
LDI r2, 407
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
