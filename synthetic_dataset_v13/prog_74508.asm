; DESCRIPTION: Composite: Sets a single magenta pixel at (218, 78) then Places a red 108x70 rectangle at position (107, 184) then Places a yellow circle of radius 69 at center (272, 105).
; PLAN: r0=218(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=184(y), r7=108(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=105(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 184
LDI r7, 108
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 105
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
