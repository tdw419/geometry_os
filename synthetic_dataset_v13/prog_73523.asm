; DESCRIPTION: Composite: Renders a black box of size 59x24 starting at (63, 11) then Draws a orange circle centered at (281, 114) with radius 77 then Places a yellow line segment connecting (292, 76) to (413, 3).
; PLAN: r0=63(x), r1=11(y), r2=59(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=114(y), r7=77(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x1), r11=76(y1), r12=413(x2), r13=3(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 11
LDI r2, 59
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 114
LDI r7, 77
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 76
LDI r12, 413
LDI r13, 3
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
