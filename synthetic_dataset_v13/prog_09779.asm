; DESCRIPTION: Composite: Creates a yellow circular shape at (272, 200) with radius 46 then Sets a single magenta pixel at (204, 245) then Draws a yellow rectangle at (138, 70) with width 73 and height 63.
; PLAN: r0=272(x), r1=200(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=245(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=70(y), r12=73(width), r13=63(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 200
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 245
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 70
LDI r12, 73
LDI r13, 63
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
