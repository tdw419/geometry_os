; DESCRIPTION: Composite: Places a magenta circle of radius 22 at center (366, 199) then Creates a magenta rectangular region at (384, 78) spanning 27 by 39 pixels.
; PLAN: r0=366(x), r1=199(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=78(y), r7=27(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 199
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 78
LDI r7, 27
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
