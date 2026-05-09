; DESCRIPTION: Draws a black line from (181, 246) to (172, 210).
; PLAN: r0=181(x1), r1=246(y1), r2=172(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 246
LDI r2, 172
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
