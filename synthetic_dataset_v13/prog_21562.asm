; DESCRIPTION: Composite: Places a blue circle of radius 56 at center (126, 190) then Draws a yellow rectangle at (361, 101) with width 37 and height 51.
; PLAN: r0=126(x), r1=190(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=101(y), r7=37(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 190
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 101
LDI r7, 37
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
