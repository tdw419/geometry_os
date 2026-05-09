; DESCRIPTION: Composite: Sets a single red pixel at (40, 195) then Places a cyan circle of radius 47 at center (321, 154) then Draws a red rectangle at (274, 43) with width 54 and height 59.
; PLAN: r0=40(x), r1=195(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=154(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x), r11=43(y), r12=54(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 195
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 154
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 43
LDI r12, 54
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
