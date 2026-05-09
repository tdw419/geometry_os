; DESCRIPTION: Composite: Renders a green box of size 12x92 starting at (298, 83) then Sets a single white pixel at (148, 33) then Draws a yellow circle centered at (473, 154) with radius 11.
; PLAN: r0=298(x), r1=83(y), r2=12(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=33(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=473(x), r11=154(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 83
LDI r2, 12
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 33
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 473
LDI r11, 154
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
