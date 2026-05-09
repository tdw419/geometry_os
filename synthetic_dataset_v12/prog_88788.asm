; DESCRIPTION: Composite: Sets a single purple pixel at (38, 253) then Renders a purple disk with center (409, 114) and radius 52 then Creates a yellow rectangular region at (7, 91) spanning 51 by 119 pixels.
; PLAN: r0=38(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=114(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x), r11=91(y), r12=51(width), r13=119(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 114
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 91
LDI r12, 51
LDI r13, 119
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
