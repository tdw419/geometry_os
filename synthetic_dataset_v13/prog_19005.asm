; DESCRIPTION: Places a white line segment connecting (68, 142) to (362, 151).
; PLAN: r0=68(x1), r1=142(y1), r2=362(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 142
LDI r2, 362
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
