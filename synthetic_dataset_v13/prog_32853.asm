; DESCRIPTION: Composite: Sets a single yellow pixel at (98, 117) then Creates a green circular shape at (145, 176) with radius 40 then Creates a purple rectangular region at (433, 39) spanning 22 by 100 pixels.
; PLAN: r0=98(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=176(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x), r11=39(y), r12=22(width), r13=100(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 145
LDI r6, 176
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 39
LDI r12, 22
LDI r13, 100
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
