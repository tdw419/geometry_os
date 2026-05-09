; DESCRIPTION: Composite: Renders a cyan disk with center (156, 92) and radius 40 then Draws a purple rectangle at (350, 31) with width 58 and height 116.
; PLAN: r0=156(x), r1=92(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=31(y), r7=58(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 92
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 31
LDI r7, 58
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
