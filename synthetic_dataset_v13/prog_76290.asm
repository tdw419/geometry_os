; DESCRIPTION: Composite: Places a magenta line segment connecting (127, 224) to (341, 131) then Renders a red disk with center (231, 125) and radius 29 then Renders a black box of size 114x16 starting at (385, 105).
; PLAN: r0=127(x1), r1=224(y1), r2=341(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=125(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=105(y), r12=114(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 224
LDI r2, 341
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 125
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 105
LDI r12, 114
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
