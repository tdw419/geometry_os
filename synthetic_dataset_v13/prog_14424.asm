; DESCRIPTION: Composite: Sets a single black pixel at (312, 46) then Draws a red rectangle at (69, 130) with width 101 and height 96 then Draws a magenta line from (381, 37) to (509, 227).
; PLAN: r0=312(x), r1=46(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=130(y), r7=101(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=381(x1), r11=37(y1), r12=509(x2), r13=227(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 46
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 69
LDI r6, 130
LDI r7, 101
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 37
LDI r12, 509
LDI r13, 227
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
