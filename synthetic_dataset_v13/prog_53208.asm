; DESCRIPTION: Composite: Renders a green box of size 82x102 starting at (156, 15) then Draws a yellow circle centered at (236, 186) with radius 64 then Places a white dot at position (335, 183).
; PLAN: r0=156(x), r1=15(y), r2=82(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=186(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=183(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 15
LDI r2, 82
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 186
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 183
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
