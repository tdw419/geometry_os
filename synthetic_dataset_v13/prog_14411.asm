; DESCRIPTION: Composite: Renders a green line between points (279, 176) and (26, 53) then Places a purple circle of radius 48 at center (198, 91) then Draws a cyan rectangle at (117, 126) with width 101 and height 117.
; PLAN: r0=279(x1), r1=176(y1), r2=26(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=91(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=126(y), r12=101(width), r13=117(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 176
LDI r2, 26
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 91
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 126
LDI r12, 101
LDI r13, 117
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
