; DESCRIPTION: Composite: Renders a white disk with center (359, 98) and radius 59 then Creates a black rectangular region at (309, 87) spanning 52 by 96 pixels then Places a red dot at position (263, 22).
; PLAN: r0=359(x), r1=98(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=87(y), r7=52(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x), r11=22(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 98
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 87
LDI r7, 52
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 22
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
