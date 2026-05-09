; DESCRIPTION: Composite: Draws a purple circle centered at (305, 98) with radius 60 then Places a white dot at position (448, 126) then Places a white 118x114 rectangle at position (225, 97).
; PLAN: r0=305(x), r1=98(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=97(y), r12=118(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 98
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 225
LDI r11, 97
LDI r12, 118
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
