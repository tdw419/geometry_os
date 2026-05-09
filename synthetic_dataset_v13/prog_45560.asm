; DESCRIPTION: Composite: Draws a magenta line from (97, 210) to (421, 177) then Places a purple circle of radius 50 at center (53, 78).
; PLAN: r0=97(x1), r1=210(y1), r2=421(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=78(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 210
LDI r2, 421
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 78
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
