; DESCRIPTION: Composite: Draws a green circle centered at (252, 187) with radius 27 then Places a blue dot at position (423, 3) then Renders a white box of size 16x109 starting at (225, 70).
; PLAN: r0=252(x), r1=187(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=3(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=70(y), r12=16(width), r13=109(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 187
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 3
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 225
LDI r11, 70
LDI r12, 16
LDI r13, 109
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
