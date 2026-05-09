; DESCRIPTION: Draws a black line from (5, 11) to (498, 102).
; PLAN: r0=5(x1), r1=11(y1), r2=498(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 11
LDI r2, 498
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
