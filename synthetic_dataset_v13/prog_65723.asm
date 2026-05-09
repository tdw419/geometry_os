; DESCRIPTION: Composite: Draws a orange rectangle at (105, 131) with width 15 and height 36 then Sets a single orange pixel at (377, 146) then Renders a yellow disk with center (421, 149) and radius 75.
; PLAN: r0=105(x), r1=131(y), r2=15(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=146(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=149(y), r12=75(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 131
LDI r2, 15
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 146
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 421
LDI r11, 149
LDI r12, 75
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
