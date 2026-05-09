; DESCRIPTION: Draws a black line from (342, 0) to (22, 156).
; PLAN: r0=342(x1), r1=0(y1), r2=22(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 0
LDI r2, 22
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
