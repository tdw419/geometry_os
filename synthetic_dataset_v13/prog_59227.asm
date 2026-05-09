; DESCRIPTION: Composite: Creates a red circular shape at (168, 121) with radius 35 then Draws a purple rectangle at (335, 91) with width 81 and height 11 then Sets a single green pixel at (88, 35).
; PLAN: r0=168(x), r1=121(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=91(y), r7=81(width), r8=11(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=35(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 121
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 91
LDI r7, 81
LDI r8, 11
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 35
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
