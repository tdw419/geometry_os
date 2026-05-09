; DESCRIPTION: Composite: Draws a white circle centered at (158, 195) with radius 43 then Renders a green box of size 112x115 starting at (196, 31) then Sets a single yellow pixel at (261, 149).
; PLAN: r0=158(x), r1=195(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=31(y), r7=112(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=149(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 195
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 31
LDI r7, 112
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 149
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
