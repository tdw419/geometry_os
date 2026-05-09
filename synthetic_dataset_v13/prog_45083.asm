; DESCRIPTION: Draws a yellow line from (257, 173) to (192, 116).
; PLAN: r0=257(x1), r1=173(y1), r2=192(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 173
LDI r2, 192
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
