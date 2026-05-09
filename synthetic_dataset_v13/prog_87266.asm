; DESCRIPTION: Composite: Creates a magenta rectangular region at (313, 144) spanning 21 by 94 pixels then Creates a cyan circular shape at (310, 195) with radius 54.
; PLAN: r0=313(x), r1=144(y), r2=21(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=195(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 144
LDI r2, 21
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 195
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
