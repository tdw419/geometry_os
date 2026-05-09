; DESCRIPTION: Composite: Draws a yellow circle centered at (305, 103) with radius 39 then Sets a single yellow pixel at (501, 156) then Renders a white box of size 77x102 starting at (161, 142).
; PLAN: r0=305(x), r1=103(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=142(y), r12=77(width), r13=102(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 103
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 161
LDI r11, 142
LDI r12, 77
LDI r13, 102
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
