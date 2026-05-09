; DESCRIPTION: Composite: Renders a cyan disk with center (143, 133) and radius 62 then Places a red dot at position (229, 42) then Creates a purple rectangular region at (147, 97) spanning 76 by 88 pixels.
; PLAN: r0=143(x), r1=133(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=42(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=97(y), r12=76(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 133
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 42
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 147
LDI r11, 97
LDI r12, 76
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
