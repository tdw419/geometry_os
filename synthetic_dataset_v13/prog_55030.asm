; DESCRIPTION: Draws a red line from (253, 132) to (368, 38).
; PLAN: r0=253(x1), r1=132(y1), r2=368(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 132
LDI r2, 368
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
