; DESCRIPTION: Composite: Creates a yellow circular shape at (295, 126) with radius 73 then Draws a purple rectangle at (44, 6) with width 43 and height 50 then Sets a single white pixel at (149, 246).
; PLAN: r0=295(x), r1=126(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=6(y), r7=43(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=246(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 126
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 6
LDI r7, 43
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 246
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
