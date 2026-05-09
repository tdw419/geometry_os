; DESCRIPTION: Composite: Renders a blue disk with center (55, 110) and radius 36 then Sets a single orange pixel at (194, 240) then Draws a orange rectangle at (465, 70) with width 44 and height 120.
; PLAN: r0=55(x), r1=110(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=240(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=465(x), r11=70(y), r12=44(width), r13=120(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 110
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 240
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 465
LDI r11, 70
LDI r12, 44
LDI r13, 120
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
