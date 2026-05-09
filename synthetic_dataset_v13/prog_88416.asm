; DESCRIPTION: Draws a black line from (157, 106) to (306, 209).
; PLAN: r0=157(x1), r1=106(y1), r2=306(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 106
LDI r2, 306
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
