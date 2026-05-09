; DESCRIPTION: Composite: Renders a black disk with center (103, 163) and radius 39 then Places a cyan line segment connecting (451, 60) to (386, 132) then Draws a purple rectangle at (134, 62) with width 114 and height 52.
; PLAN: r0=103(x), r1=163(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=60(y1), r7=386(x2), r8=132(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=62(y), r12=114(width), r13=52(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 163
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 60
LDI r7, 386
LDI r8, 132
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 62
LDI r12, 114
LDI r13, 52
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
