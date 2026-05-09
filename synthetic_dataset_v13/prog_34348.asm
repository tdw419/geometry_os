; DESCRIPTION: Composite: Places a white line segment connecting (91, 85) to (475, 164) then Renders a orange disk with center (288, 72) and radius 31 then Draws a black rectangle at (279, 64) with width 11 and height 43.
; PLAN: r0=91(x1), r1=85(y1), r2=475(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=72(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=64(y), r12=11(width), r13=43(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 85
LDI r2, 475
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 72
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 64
LDI r12, 11
LDI r13, 43
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
