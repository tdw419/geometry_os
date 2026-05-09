; DESCRIPTION: Composite: Draws a cyan circle centered at (67, 81) with radius 42 then Creates a white rectangular region at (489, 37) spanning 11 by 29 pixels.
; PLAN: r0=67(x), r1=81(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=37(y), r7=11(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 81
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 37
LDI r7, 11
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
