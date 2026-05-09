; DESCRIPTION: Composite: Renders a blue disk with center (460, 240) and radius 16 then Creates a cyan rectangular region at (227, 167) spanning 83 by 42 pixels then Places a purple dot at position (100, 71).
; PLAN: r0=460(x), r1=240(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=167(y), r7=83(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=71(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 240
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 167
LDI r7, 83
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 71
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
