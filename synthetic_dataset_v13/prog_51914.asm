; DESCRIPTION: Composite: Renders a black disk with center (448, 149) and radius 57 then Draws a red rectangle at (288, 180) with width 46 and height 65 then Sets a single yellow pixel at (16, 195).
; PLAN: r0=448(x), r1=149(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=180(y), r7=46(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=16(x), r11=195(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 149
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 180
LDI r7, 46
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 195
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
