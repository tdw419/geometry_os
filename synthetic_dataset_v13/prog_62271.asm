; DESCRIPTION: Places a black line segment connecting (452, 58) to (154, 73).
; PLAN: r0=452(x1), r1=58(y1), r2=154(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 58
LDI r2, 154
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
