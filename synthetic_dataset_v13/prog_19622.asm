; DESCRIPTION: Composite: Renders a orange box of size 115x69 starting at (105, 29) then Places a orange circle of radius 66 at center (275, 152) then Sets a single black pixel at (266, 95).
; PLAN: r0=105(x), r1=29(y), r2=115(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=152(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x), r11=95(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 29
LDI r2, 115
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 152
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 95
LDI r12, 0x000000
PSET r10, r11, r12
HALT
