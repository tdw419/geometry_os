; DESCRIPTION: Composite: Renders a white box of size 72x30 starting at (61, 177) then Places a cyan dot at position (244, 104) then Draws a orange circle centered at (247, 97) with radius 20.
; PLAN: r0=61(x), r1=177(y), r2=72(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=104(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=97(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 177
LDI r2, 72
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 104
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 97
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
