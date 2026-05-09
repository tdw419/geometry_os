; DESCRIPTION: Composite: Draws a green circle centered at (300, 126) with radius 43 then Places a green 37x68 rectangle at position (422, 118) then Sets a single black pixel at (441, 78).
; PLAN: r0=300(x), r1=126(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=118(y), r7=37(width), r8=68(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=78(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 126
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 118
LDI r7, 37
LDI r8, 68
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 78
LDI r12, 0x000000
PSET r10, r11, r12
HALT
