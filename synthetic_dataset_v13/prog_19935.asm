; DESCRIPTION: Places a black line segment connecting (506, 95) to (306, 42).
; PLAN: r0=506(x1), r1=95(y1), r2=306(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 95
LDI r2, 306
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
