; DESCRIPTION: Composite: Creates a cyan circular shape at (197, 169) with radius 22 then Draws a orange rectangle at (133, 120) with width 107 and height 74 then Sets a single orange pixel at (254, 151).
; PLAN: r0=197(x), r1=169(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=120(y), r7=107(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=254(x), r11=151(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 169
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 120
LDI r7, 107
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 151
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
