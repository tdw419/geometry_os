; DESCRIPTION: Composite: Creates a yellow circular shape at (278, 126) with radius 47 then Draws a yellow rectangle at (205, 102) with width 46 and height 64 then Sets a single magenta pixel at (149, 55).
; PLAN: r0=278(x), r1=126(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=102(y), r7=46(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=55(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 126
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 102
LDI r7, 46
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 55
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
