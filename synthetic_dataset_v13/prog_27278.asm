; DESCRIPTION: Composite: Places a black dot at position (75, 103) then Renders a magenta box of size 114x39 starting at (205, 112) then Draws a purple circle centered at (218, 77) with radius 41.
; PLAN: r0=75(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=112(y), r7=114(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=77(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 75
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 205
LDI r6, 112
LDI r7, 114
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 77
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
