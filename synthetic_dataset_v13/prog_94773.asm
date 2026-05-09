; DESCRIPTION: Places a black line segment connecting (18, 95) to (205, 153).
; PLAN: r0=18(x1), r1=95(y1), r2=205(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 95
LDI r2, 205
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
