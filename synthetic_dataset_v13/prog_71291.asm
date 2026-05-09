; DESCRIPTION: Places a black line segment connecting (329, 101) to (82, 73).
; PLAN: r0=329(x1), r1=101(y1), r2=82(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 101
LDI r2, 82
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
