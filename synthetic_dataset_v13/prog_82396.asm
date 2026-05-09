; DESCRIPTION: Composite: Sets a single blue pixel at (82, 205) then Renders a magenta box of size 120x115 starting at (162, 43) then Draws a magenta circle centered at (347, 86) with radius 74.
; PLAN: r0=82(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=43(y), r7=120(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=86(y), r12=74(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 43
LDI r7, 120
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 86
LDI r12, 74
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
