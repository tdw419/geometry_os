; DESCRIPTION: Composite: Places a orange 97x95 rectangle at position (406, 133) then Places a purple dot at position (324, 236) then Draws a cyan circle centered at (340, 76) with radius 60.
; PLAN: r0=406(x), r1=133(y), r2=97(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=236(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=76(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 133
LDI r2, 97
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 236
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 76
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
