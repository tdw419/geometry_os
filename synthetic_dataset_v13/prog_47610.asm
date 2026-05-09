; DESCRIPTION: Composite: Renders a purple box of size 63x37 starting at (48, 81) then Draws a magenta line from (347, 24) to (374, 19) then Places a cyan circle of radius 76 at center (132, 90).
; PLAN: r0=48(x), r1=81(y), r2=63(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=24(y1), r7=374(x2), r8=19(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=90(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 81
LDI r2, 63
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 24
LDI r7, 374
LDI r8, 19
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 90
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
