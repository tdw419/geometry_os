; DESCRIPTION: Composite: Places a white 119x46 rectangle at position (104, 117) then Sets a single white pixel at (183, 145) then Renders a orange disk with center (274, 220) and radius 21.
; PLAN: r0=104(x), r1=117(y), r2=119(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=145(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=274(x), r11=220(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 117
LDI r2, 119
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 145
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 274
LDI r11, 220
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
