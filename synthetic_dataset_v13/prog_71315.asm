; DESCRIPTION: Places a white line segment connecting (50, 247) to (14, 151).
; PLAN: r0=50(x1), r1=247(y1), r2=14(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 247
LDI r2, 14
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
