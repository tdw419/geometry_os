; DESCRIPTION: Composite: Renders a white disk with center (248, 113) and radius 75 then Places a red dot at position (246, 144) then Places a orange 91x25 rectangle at position (22, 172).
; PLAN: r0=248(x), r1=113(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=144(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=172(y), r12=91(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 113
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 144
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 22
LDI r11, 172
LDI r12, 91
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
