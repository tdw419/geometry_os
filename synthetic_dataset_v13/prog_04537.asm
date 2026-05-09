; DESCRIPTION: Composite: Sets a single cyan pixel at (281, 163) then Draws a purple rectangle at (17, 55) with width 105 and height 71 then Places a black line segment connecting (399, 193) to (130, 129).
; PLAN: r0=281(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=55(y), r7=105(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x1), r11=193(y1), r12=130(x2), r13=129(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 55
LDI r7, 105
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 193
LDI r12, 130
LDI r13, 129
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
