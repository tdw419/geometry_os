; DESCRIPTION: Composite: Sets a single blue pixel at (226, 220) then Places a cyan 114x11 rectangle at position (244, 57) then Creates a white circular shape at (350, 72) with radius 35.
; PLAN: r0=226(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=57(y), r7=114(width), r8=11(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=350(x), r11=72(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 57
LDI r7, 114
LDI r8, 11
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 72
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
