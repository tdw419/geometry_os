; DESCRIPTION: Composite: Renders a magenta line between points (289, 224) and (216, 57) then Places a yellow dot at position (13, 230) then Renders a black box of size 12x47 starting at (147, 129).
; PLAN: r0=289(x1), r1=224(y1), r2=216(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=230(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=129(y), r12=12(width), r13=47(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 224
LDI r2, 216
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 230
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 147
LDI r11, 129
LDI r12, 12
LDI r13, 47
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
