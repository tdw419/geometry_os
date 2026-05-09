; DESCRIPTION: Composite: Draws a purple rectangle at (312, 193) with width 53 and height 50 then Renders a cyan line between points (269, 32) and (63, 244) then Draws a orange circle centered at (350, 109) with radius 65.
; PLAN: r0=312(x), r1=193(y), r2=53(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x1), r6=32(y1), r7=63(x2), r8=244(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=109(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 193
LDI r2, 53
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 32
LDI r7, 63
LDI r8, 244
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 109
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
