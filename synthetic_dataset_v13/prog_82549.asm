; DESCRIPTION: Composite: Places a green circle of radius 63 at center (403, 111) then Sets a single yellow pixel at (454, 158) then Renders a orange box of size 84x71 starting at (222, 155).
; PLAN: r0=403(x), r1=111(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=158(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=155(y), r12=84(width), r13=71(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 111
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 158
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 222
LDI r11, 155
LDI r12, 84
LDI r13, 71
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
