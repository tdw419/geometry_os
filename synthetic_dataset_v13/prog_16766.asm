; DESCRIPTION: Composite: Draws a purple line from (194, 116) to (101, 11) then Places a magenta circle of radius 21 at center (463, 143).
; PLAN: r0=194(x1), r1=116(y1), r2=101(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=143(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 116
LDI r2, 101
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 143
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
