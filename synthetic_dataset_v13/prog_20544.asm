; DESCRIPTION: Composite: Creates a green circular shape at (311, 152) with radius 50 then Places a black dot at position (12, 80) then Draws a purple rectangle at (78, 75) with width 112 and height 78.
; PLAN: r0=311(x), r1=152(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=80(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=75(y), r12=112(width), r13=78(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 152
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 80
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 78
LDI r11, 75
LDI r12, 112
LDI r13, 78
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
