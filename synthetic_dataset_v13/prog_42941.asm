; DESCRIPTION: Composite: Renders a yellow disk with center (378, 155) and radius 70 then Sets a single cyan pixel at (444, 39) then Draws a yellow rectangle at (198, 10) with width 55 and height 70.
; PLAN: r0=378(x), r1=155(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=39(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=10(y), r12=55(width), r13=70(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 155
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 39
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 198
LDI r11, 10
LDI r12, 55
LDI r13, 70
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
