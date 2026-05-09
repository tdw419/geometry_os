; DESCRIPTION: Composite: Draws a cyan circle centered at (269, 126) with radius 16 then Renders a white box of size 81x96 starting at (96, 147).
; PLAN: r0=269(x), r1=126(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=147(y), r7=81(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 126
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 147
LDI r7, 81
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
