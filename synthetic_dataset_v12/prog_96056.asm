; DESCRIPTION: Composite: Draws a magenta circle centered at (280, 166) with radius 69 then Creates a yellow rectangular region at (443, 131) spanning 24 by 13 pixels.
; PLAN: r0=280(x), r1=166(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=131(y), r7=24(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 166
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 131
LDI r7, 24
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
