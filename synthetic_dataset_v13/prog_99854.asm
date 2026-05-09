; DESCRIPTION: Composite: Draws a cyan rectangle at (11, 160) with width 45 and height 56 then Places a cyan circle of radius 19 at center (130, 143) then Renders a purple line between points (128, 144) and (23, 150).
; PLAN: r0=11(x), r1=160(y), r2=45(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=143(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x1), r11=144(y1), r12=23(x2), r13=150(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 160
LDI r2, 45
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 143
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 144
LDI r12, 23
LDI r13, 150
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
