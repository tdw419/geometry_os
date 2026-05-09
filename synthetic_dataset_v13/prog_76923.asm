; DESCRIPTION: Places a black line segment connecting (477, 247) to (167, 184).
; PLAN: r0=477(x1), r1=247(y1), r2=167(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 247
LDI r2, 167
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
