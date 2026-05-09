; DESCRIPTION: Draws a yellow line from (43, 137) to (486, 195).
; PLAN: r0=43(x1), r1=137(y1), r2=486(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 137
LDI r2, 486
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
