; DESCRIPTION: Places a black line segment connecting (113, 242) to (90, 116).
; PLAN: r0=113(x1), r1=242(y1), r2=90(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 242
LDI r2, 90
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
