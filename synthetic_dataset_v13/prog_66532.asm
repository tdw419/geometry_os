; DESCRIPTION: Composite: Creates a purple rectangular region at (222, 123) spanning 98 by 108 pixels then Renders a black disk with center (243, 79) and radius 76 then Places a white dot at position (56, 14).
; PLAN: r0=222(x), r1=123(y), r2=98(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=79(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=56(x), r11=14(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 123
LDI r2, 98
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 79
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 56
LDI r11, 14
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
