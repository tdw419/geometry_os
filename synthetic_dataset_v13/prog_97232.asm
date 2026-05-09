; DESCRIPTION: Composite: Places a yellow circle of radius 69 at center (94, 166) then Creates a magenta rectangular region at (307, 10) spanning 13 by 31 pixels.
; PLAN: r0=94(x), r1=166(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=10(y), r7=13(width), r8=31(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 166
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 10
LDI r7, 13
LDI r8, 31
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
