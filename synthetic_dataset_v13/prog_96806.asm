; DESCRIPTION: Composite: Draws a black line from (251, 240) to (296, 126) then Places a green circle of radius 30 at center (415, 212) then Places a black 97x68 rectangle at position (209, 137).
; PLAN: r0=251(x1), r1=240(y1), r2=296(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=212(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=137(y), r12=97(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 240
LDI r2, 296
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 212
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 137
LDI r12, 97
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
