; DESCRIPTION: Composite: Places a purple dot at position (447, 49) then Renders a magenta box of size 52x42 starting at (133, 212) then Draws a white circle centered at (129, 154) with radius 66.
; PLAN: r0=447(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=212(y), r7=52(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=154(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 212
LDI r7, 52
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 154
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
