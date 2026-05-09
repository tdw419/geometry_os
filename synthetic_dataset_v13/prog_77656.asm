; DESCRIPTION: Composite: Renders a yellow disk with center (216, 105) and radius 24 then Draws a green rectangle at (175, 90) with width 63 and height 17 then Sets a single white pixel at (288, 208).
; PLAN: r0=216(x), r1=105(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=90(y), r7=63(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=208(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 105
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 90
LDI r7, 63
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 208
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
