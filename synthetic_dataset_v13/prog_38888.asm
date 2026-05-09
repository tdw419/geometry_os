; DESCRIPTION: Composite: Creates a cyan circular shape at (335, 160) with radius 29 then Draws a purple rectangle at (96, 8) with width 87 and height 86.
; PLAN: r0=335(x), r1=160(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=8(y), r7=87(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 160
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 8
LDI r7, 87
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
