; DESCRIPTION: Composite: Draws a cyan rectangle at (432, 125) with width 78 and height 31 then Creates a cyan circular shape at (369, 58) with radius 42.
; PLAN: r0=432(x), r1=125(y), r2=78(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=58(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 125
LDI r2, 78
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 58
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
