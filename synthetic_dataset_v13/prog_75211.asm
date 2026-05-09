; DESCRIPTION: Composite: Renders a cyan disk with center (344, 191) and radius 47 then Draws a purple rectangle at (160, 64) with width 32 and height 106.
; PLAN: r0=344(x), r1=191(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=64(y), r7=32(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 191
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 64
LDI r7, 32
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
