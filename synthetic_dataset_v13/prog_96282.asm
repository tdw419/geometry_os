; DESCRIPTION: Composite: Places a white dot at position (367, 96) then Places a blue 83x55 rectangle at position (165, 162) then Creates a blue circular shape at (260, 170) with radius 30.
; PLAN: r0=367(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=162(y), r7=83(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=170(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 162
LDI r7, 83
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 170
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
