; DESCRIPTION: Composite: Creates a yellow rectangular region at (111, 48) spanning 102 by 56 pixels then Sets a single blue pixel at (117, 0) then Renders a orange line between points (393, 43) and (494, 124).
; PLAN: r0=111(x), r1=48(y), r2=102(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=0(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=393(x1), r11=43(y1), r12=494(x2), r13=124(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 48
LDI r2, 102
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 0
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 393
LDI r11, 43
LDI r12, 494
LDI r13, 124
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
