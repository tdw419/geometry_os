; DESCRIPTION: Composite: Places a orange dot at position (328, 193) then Creates a green circular shape at (171, 37) with radius 35 then Places a purple 39x30 rectangle at position (388, 185).
; PLAN: r0=328(x), r1=193(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=37(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=185(y), r12=39(width), r13=30(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 193
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 171
LDI r6, 37
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 185
LDI r12, 39
LDI r13, 30
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
