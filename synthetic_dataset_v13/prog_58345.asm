; DESCRIPTION: Composite: Creates a black circular shape at (258, 100) with radius 60 then Draws a green rectangle at (262, 133) with width 40 and height 115 then Sets a single cyan pixel at (325, 134).
; PLAN: r0=258(x), r1=100(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=133(y), r7=40(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x), r11=134(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 100
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 133
LDI r7, 40
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 134
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
