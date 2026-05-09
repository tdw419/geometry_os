; DESCRIPTION: Composite: Places a yellow dot at position (223, 160) then Places a yellow circle of radius 80 at center (260, 167) then Draws a white rectangle at (172, 195) with width 70 and height 44.
; PLAN: r0=223(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=167(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x), r11=195(y), r12=70(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 160
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 167
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 195
LDI r12, 70
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
