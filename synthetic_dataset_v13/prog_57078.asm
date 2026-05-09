; DESCRIPTION: Composite: Renders a cyan box of size 105x105 starting at (209, 77) then Places a white dot at position (215, 13) then Places a black line segment connecting (500, 85) to (318, 159).
; PLAN: r0=209(x), r1=77(y), r2=105(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=13(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=500(x1), r11=85(y1), r12=318(x2), r13=159(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 77
LDI r2, 105
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 13
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 500
LDI r11, 85
LDI r12, 318
LDI r13, 159
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
