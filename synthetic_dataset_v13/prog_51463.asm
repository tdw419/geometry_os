; DESCRIPTION: Composite: Draws a magenta circle centered at (78, 163) with radius 37 then Places a yellow 116x59 rectangle at position (57, 52).
; PLAN: r0=78(x), r1=163(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=52(y), r7=116(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 163
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 52
LDI r7, 116
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
