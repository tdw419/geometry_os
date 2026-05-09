; DESCRIPTION: Composite: Draws a red rectangle at (70, 12) with width 36 and height 91 then Renders a white disk with center (243, 229) and radius 13 then Sets a single red pixel at (377, 136).
; PLAN: r0=70(x), r1=12(y), r2=36(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=229(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=136(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 12
LDI r2, 36
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 229
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 136
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
