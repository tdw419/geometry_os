; DESCRIPTION: Composite: Renders a orange disk with center (299, 166) and radius 76 then Sets a single black pixel at (144, 248) then Places a orange line segment connecting (465, 83) to (295, 19).
; PLAN: r0=299(x), r1=166(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=248(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=465(x1), r11=83(y1), r12=295(x2), r13=19(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 166
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 248
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 465
LDI r11, 83
LDI r12, 295
LDI r13, 19
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
