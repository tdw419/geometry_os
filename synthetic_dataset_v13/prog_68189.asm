; DESCRIPTION: Places a white line segment connecting (341, 96) to (481, 244).
; PLAN: r0=341(x1), r1=96(y1), r2=481(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 96
LDI r2, 481
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
