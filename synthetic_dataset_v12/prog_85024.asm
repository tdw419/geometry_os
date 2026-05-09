; DESCRIPTION: Composite: Places a purple 33x97 rectangle at position (264, 132) then Draws a white circle centered at (247, 155) with radius 27 then Places a green dot at position (486, 195).
; PLAN: r0=264(x), r1=132(y), r2=33(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=155(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x), r11=195(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 132
LDI r2, 33
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 155
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 195
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
