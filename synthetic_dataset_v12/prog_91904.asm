; DESCRIPTION: Composite: Draws a blue line from (452, 203) to (26, 135) then Places a magenta circle of radius 39 at center (341, 58).
; PLAN: r0=452(x1), r1=203(y1), r2=26(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=58(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 452
LDI r1, 203
LDI r2, 26
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 58
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
