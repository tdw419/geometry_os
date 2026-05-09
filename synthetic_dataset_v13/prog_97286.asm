; DESCRIPTION: Composite: Draws a white rectangle at (86, 38) with width 79 and height 15 then Creates a cyan circular shape at (77, 138) with radius 65.
; PLAN: r0=86(x), r1=38(y), r2=79(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=138(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 38
LDI r2, 79
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 138
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
