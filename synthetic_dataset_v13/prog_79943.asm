; DESCRIPTION: Places a black line segment connecting (246, 241) to (18, 50).
; PLAN: r0=246(x1), r1=241(y1), r2=18(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 241
LDI r2, 18
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
