; DESCRIPTION: Composite: Creates a green rectangular region at (271, 104) spanning 91 by 113 pixels then Draws a purple circle centered at (81, 37) with radius 31.
; PLAN: r0=271(x), r1=104(y), r2=91(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=37(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 104
LDI r2, 91
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 37
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
