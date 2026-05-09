; DESCRIPTION: Composite: Draws a green circle centered at (428, 204) with radius 26 then Sets a single magenta pixel at (370, 245) then Creates a blue rectangular region at (103, 140) spanning 89 by 18 pixels.
; PLAN: r0=428(x), r1=204(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=245(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=140(y), r12=89(width), r13=18(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 204
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 245
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 140
LDI r12, 89
LDI r13, 18
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
