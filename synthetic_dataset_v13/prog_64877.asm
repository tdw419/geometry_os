; DESCRIPTION: Composite: Sets a single magenta pixel at (183, 1) then Renders a magenta box of size 59x79 starting at (251, 46) then Draws a blue circle centered at (45, 36) with radius 35.
; PLAN: r0=183(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=46(y), r7=59(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=36(y), r12=35(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 46
LDI r7, 59
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 36
LDI r12, 35
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
