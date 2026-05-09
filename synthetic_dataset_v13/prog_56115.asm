; DESCRIPTION: Composite: Renders a orange disk with center (235, 132) and radius 65 then Places a cyan dot at position (226, 100) then Places a purple 59x107 rectangle at position (372, 49).
; PLAN: r0=235(x), r1=132(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=100(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=372(x), r11=49(y), r12=59(width), r13=107(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 132
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 100
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 372
LDI r11, 49
LDI r12, 59
LDI r13, 107
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
