; DESCRIPTION: Composite: Places a red circle of radius 14 at center (438, 86) then Places a blue line segment connecting (256, 9) to (511, 150) then Draws a yellow rectangle at (51, 228) with width 107 and height 27.
; PLAN: r0=438(x), r1=86(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x1), r6=9(y1), r7=511(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=228(y), r12=107(width), r13=27(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 86
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 9
LDI r7, 511
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 228
LDI r12, 107
LDI r13, 27
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
