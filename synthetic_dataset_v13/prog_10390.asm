; DESCRIPTION: Places a green line segment connecting (495, 18) to (148, 95).
; PLAN: r0=495(x1), r1=18(y1), r2=148(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 18
LDI r2, 148
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
