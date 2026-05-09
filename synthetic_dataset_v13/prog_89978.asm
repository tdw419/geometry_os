; DESCRIPTION: Draws a black line from (45, 156) to (39, 96).
; PLAN: r0=45(x1), r1=156(y1), r2=39(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 156
LDI r2, 39
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
