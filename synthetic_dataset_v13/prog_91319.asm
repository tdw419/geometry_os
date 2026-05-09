; DESCRIPTION: Composite: Places a purple dot at position (227, 32) then Draws a white rectangle at (348, 69) with width 83 and height 96 then Places a green line segment connecting (451, 21) to (114, 240).
; PLAN: r0=227(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=69(y), r7=83(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=21(y1), r12=114(x2), r13=240(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 69
LDI r7, 83
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 21
LDI r12, 114
LDI r13, 240
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
