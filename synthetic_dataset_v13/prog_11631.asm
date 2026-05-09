; DESCRIPTION: Composite: Creates a magenta circular shape at (213, 200) with radius 30 then Draws a blue rectangle at (149, 143) with width 66 and height 82 then Sets a single orange pixel at (210, 85).
; PLAN: r0=213(x), r1=200(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=143(y), r7=66(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=85(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 200
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 143
LDI r7, 66
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 85
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
