; DESCRIPTION: Composite: Renders a purple box of size 83x112 starting at (391, 138) then Places a black circle of radius 57 at center (382, 146) then Places a black line segment connecting (197, 216) to (0, 222).
; PLAN: r0=391(x), r1=138(y), r2=83(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=146(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=197(x1), r11=216(y1), r12=0(x2), r13=222(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 138
LDI r2, 83
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 146
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 197
LDI r11, 216
LDI r12, 0
LDI r13, 222
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
