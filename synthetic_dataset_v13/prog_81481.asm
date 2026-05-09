; DESCRIPTION: Composite: Draws a yellow rectangle at (274, 182) with width 115 and height 58 then Places a cyan circle of radius 65 at center (256, 172).
; PLAN: r0=274(x), r1=182(y), r2=115(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=172(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 182
LDI r2, 115
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 172
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
