; DESCRIPTION: Composite: Places a orange dot at position (51, 103) then Renders a white box of size 53x21 starting at (264, 174) then Draws a magenta circle centered at (195, 150) with radius 64.
; PLAN: r0=51(x), r1=103(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=174(y), r7=53(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x), r11=150(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 103
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 264
LDI r6, 174
LDI r7, 53
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 150
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
