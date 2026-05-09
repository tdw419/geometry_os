; DESCRIPTION: Composite: Renders a green disk with center (396, 143) and radius 62 then Places a purple dot at position (193, 68) then Places a orange 110x82 rectangle at position (98, 162).
; PLAN: r0=396(x), r1=143(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=68(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=162(y), r12=110(width), r13=82(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 143
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 68
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 98
LDI r11, 162
LDI r12, 110
LDI r13, 82
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
