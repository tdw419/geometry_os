; DESCRIPTION: Composite: Places a magenta dot at position (368, 156) then Places a yellow line segment connecting (275, 248) to (345, 174) then Draws a purple rectangle at (300, 141) with width 32 and height 114.
; PLAN: r0=368(x), r1=156(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=248(y1), r7=345(x2), r8=174(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=141(y), r12=32(width), r13=114(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 156
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 248
LDI r7, 345
LDI r8, 174
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 141
LDI r12, 32
LDI r13, 114
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
