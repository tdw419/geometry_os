; DESCRIPTION: Composite: Renders a black box of size 13x66 starting at (266, 93) then Draws a purple circle centered at (388, 151) with radius 57 then Places a blue dot at position (290, 246).
; PLAN: r0=266(x), r1=93(y), r2=13(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=151(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=246(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 93
LDI r2, 13
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 151
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 246
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
