; DESCRIPTION: Draws a red line from (257, 30) to (181, 17).
; PLAN: r0=257(x1), r1=30(y1), r2=181(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 30
LDI r2, 181
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
