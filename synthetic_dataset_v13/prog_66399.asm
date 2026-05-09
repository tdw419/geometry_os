; DESCRIPTION: Places a black line segment connecting (182, 25) to (498, 212).
; PLAN: r0=182(x1), r1=25(y1), r2=498(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 25
LDI r2, 498
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
