; DESCRIPTION: Composite: Draws a black rectangle at (110, 20) with width 57 and height 46 then Creates a cyan circular shape at (358, 177) with radius 49.
; PLAN: r0=110(x), r1=20(y), r2=57(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=177(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 20
LDI r2, 57
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 177
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
