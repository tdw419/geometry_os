; DESCRIPTION: Composite: Renders a black disk with center (463, 138) and radius 44 then Draws a yellow rectangle at (70, 18) with width 16 and height 10 then Sets a single magenta pixel at (251, 167).
; PLAN: r0=463(x), r1=138(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=18(y), r7=16(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=167(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 138
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 18
LDI r7, 16
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 167
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
