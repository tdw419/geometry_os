; DESCRIPTION: Composite: Creates a purple circular shape at (347, 138) with radius 78 then Sets a single cyan pixel at (322, 84) then Renders a cyan box of size 64x60 starting at (87, 0).
; PLAN: r0=347(x), r1=138(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=84(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=0(y), r12=64(width), r13=60(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 138
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 84
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 87
LDI r11, 0
LDI r12, 64
LDI r13, 60
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
