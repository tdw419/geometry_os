; DESCRIPTION: Composite: Creates a red rectangular region at (324, 73) spanning 76 by 68 pixels then Places a blue dot at position (231, 235) then Creates a yellow circular shape at (132, 12) with radius 10.
; PLAN: r0=324(x), r1=73(y), r2=76(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=235(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=12(y), r12=10(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 73
LDI r2, 76
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 235
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 12
LDI r12, 10
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
