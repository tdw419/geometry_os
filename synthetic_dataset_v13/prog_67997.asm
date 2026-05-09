; DESCRIPTION: Composite: Places a yellow dot at position (466, 195) then Creates a blue rectangular region at (296, 10) spanning 95 by 63 pixels then Places a purple circle of radius 40 at center (424, 102).
; PLAN: r0=466(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=10(y), r7=95(width), r8=63(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=424(x), r11=102(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 195
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 296
LDI r6, 10
LDI r7, 95
LDI r8, 63
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 102
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
