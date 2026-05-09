; DESCRIPTION: Composite: Renders a yellow line between points (237, 240) and (118, 107) then Places a yellow circle of radius 52 at center (319, 79) then Renders a black box of size 103x13 starting at (248, 5).
; PLAN: r0=237(x1), r1=240(y1), r2=118(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=79(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=5(y), r12=103(width), r13=13(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 240
LDI r2, 118
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 79
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 5
LDI r12, 103
LDI r13, 13
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
