; DESCRIPTION: Composite: Sets a single red pixel at (210, 245) then Draws a yellow circle centered at (245, 163) with radius 15 then Renders a yellow box of size 76x54 starting at (217, 141).
; PLAN: r0=210(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=163(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=141(y), r12=76(width), r13=54(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 245
LDI r6, 163
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 141
LDI r12, 76
LDI r13, 54
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
