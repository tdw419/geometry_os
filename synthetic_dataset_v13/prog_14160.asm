; DESCRIPTION: Composite: Creates a green circular shape at (113, 92) with radius 26 then Creates a magenta rectangular region at (390, 29) spanning 56 by 44 pixels.
; PLAN: r0=113(x), r1=92(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x), r6=29(y), r7=56(width), r8=44(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 92
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 29
LDI r7, 56
LDI r8, 44
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
