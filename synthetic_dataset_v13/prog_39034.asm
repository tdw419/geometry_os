; DESCRIPTION: Composite: Draws a white circle centered at (396, 134) with radius 78 then Places a purple dot at position (340, 213) then Places a cyan line segment connecting (235, 164) to (83, 39).
; PLAN: r0=396(x), r1=134(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=213(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=235(x1), r11=164(y1), r12=83(x2), r13=39(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 134
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 213
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 164
LDI r12, 83
LDI r13, 39
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
