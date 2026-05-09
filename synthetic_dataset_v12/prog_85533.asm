; DESCRIPTION: Composite: Renders a black disk with center (170, 67) and radius 66 then Renders a white box of size 87x115 starting at (384, 136) then Renders a magenta line between points (15, 17) and (249, 124).
; PLAN: r0=170(x), r1=67(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=136(y), r7=87(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=15(x1), r11=17(y1), r12=249(x2), r13=124(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 67
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 136
LDI r7, 87
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 17
LDI r12, 249
LDI r13, 124
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
