; DESCRIPTION: Composite: Renders a black box of size 114x52 starting at (256, 197) then Places a yellow line segment connecting (228, 39) to (208, 245) then Draws a yellow circle centered at (402, 195) with radius 48.
; PLAN: r0=256(x), r1=197(y), r2=114(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x1), r6=39(y1), r7=208(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=195(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 197
LDI r2, 114
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 39
LDI r7, 208
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 195
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
