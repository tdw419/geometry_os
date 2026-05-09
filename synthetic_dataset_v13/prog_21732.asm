; DESCRIPTION: Composite: Renders a cyan line between points (371, 157) and (40, 173) then Places a green dot at position (430, 198) then Draws a purple circle centered at (450, 154) with radius 28.
; PLAN: r0=371(x1), r1=157(y1), r2=40(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=198(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=450(x), r11=154(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 157
LDI r2, 40
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 198
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 450
LDI r11, 154
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
