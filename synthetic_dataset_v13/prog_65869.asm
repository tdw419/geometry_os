; DESCRIPTION: Draws a yellow line from (263, 167) to (316, 48).
; PLAN: r0=263(x1), r1=167(y1), r2=316(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 167
LDI r2, 316
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
