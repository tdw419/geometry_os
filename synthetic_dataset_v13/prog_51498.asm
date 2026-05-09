; DESCRIPTION: Composite: Sets a single purple pixel at (347, 226) then Draws a magenta rectangle at (254, 82) with width 25 and height 54 then Renders a magenta disk with center (405, 85) and radius 62.
; PLAN: r0=347(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=82(y), r7=25(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=85(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 82
LDI r7, 25
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 85
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
