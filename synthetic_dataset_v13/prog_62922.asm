; DESCRIPTION: Composite: Draws a cyan line from (337, 13) to (204, 135) then Draws a purple rectangle at (423, 144) with width 65 and height 10 then Places a purple circle of radius 63 at center (420, 137).
; PLAN: r0=337(x1), r1=13(y1), r2=204(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=144(y), r7=65(width), r8=10(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=420(x), r11=137(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 13
LDI r2, 204
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 144
LDI r7, 65
LDI r8, 10
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 137
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
