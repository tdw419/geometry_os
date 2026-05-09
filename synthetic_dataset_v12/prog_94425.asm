; DESCRIPTION: Composite: Sets a single white pixel at (140, 72) then Draws a blue circle centered at (293, 77) with radius 45 then Creates a yellow rectangular region at (127, 90) spanning 76 by 16 pixels.
; PLAN: r0=140(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=77(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x), r11=90(y), r12=76(width), r13=16(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 77
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 90
LDI r12, 76
LDI r13, 16
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
