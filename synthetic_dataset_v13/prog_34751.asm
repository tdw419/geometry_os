; DESCRIPTION: Composite: Draws a black rectangle at (410, 101) with width 51 and height 120 then Creates a yellow circular shape at (303, 125) with radius 15 then Sets a single white pixel at (405, 124).
; PLAN: r0=410(x), r1=101(y), r2=51(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=125(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=124(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 101
LDI r2, 51
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 125
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 124
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
