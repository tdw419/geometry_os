; DESCRIPTION: Places a green line segment connecting (120, 166) to (150, 151).
; PLAN: r0=120(x1), r1=166(y1), r2=150(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 166
LDI r2, 150
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
