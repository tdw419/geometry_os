; DESCRIPTION: Composite: Places a cyan circle of radius 12 at center (453, 46) then Sets a single blue pixel at (312, 97) then Draws a red rectangle at (74, 117) with width 45 and height 58.
; PLAN: r0=453(x), r1=46(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=97(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=117(y), r12=45(width), r13=58(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 46
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 97
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 74
LDI r11, 117
LDI r12, 45
LDI r13, 58
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
