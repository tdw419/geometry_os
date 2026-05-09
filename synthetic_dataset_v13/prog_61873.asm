; DESCRIPTION: Composite: Renders a green disk with center (289, 98) and radius 43 then Renders a purple box of size 114x106 starting at (288, 92) then Places a magenta line segment connecting (339, 245) to (269, 20).
; PLAN: r0=289(x), r1=98(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=92(y), r7=114(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x1), r11=245(y1), r12=269(x2), r13=20(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 98
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 92
LDI r7, 114
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 245
LDI r12, 269
LDI r13, 20
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
