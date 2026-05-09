; DESCRIPTION: Composite: Renders a cyan box of size 115x104 starting at (67, 109) then Draws a purple circle centered at (439, 222) with radius 14.
; PLAN: r0=67(x), r1=109(y), r2=115(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=222(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 109
LDI r2, 115
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 222
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
