; DESCRIPTION: Composite: Draws a purple rectangle at (419, 15) with width 88 and height 46 then Sets a single orange pixel at (260, 206) then Places a white circle of radius 11 at center (30, 236).
; PLAN: r0=419(x), r1=15(y), r2=88(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=206(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=30(x), r11=236(y), r12=11(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 15
LDI r2, 88
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 206
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 30
LDI r11, 236
LDI r12, 11
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
