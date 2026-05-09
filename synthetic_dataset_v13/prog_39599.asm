; DESCRIPTION: Draws a black line from (427, 112) to (197, 45).
; PLAN: r0=427(x1), r1=112(y1), r2=197(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 112
LDI r2, 197
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
