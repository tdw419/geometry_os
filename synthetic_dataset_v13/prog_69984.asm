; DESCRIPTION: Composite: Places a red dot at position (36, 218) then Creates a purple circular shape at (214, 62) with radius 59 then Creates a green rectangular region at (429, 79) spanning 27 by 71 pixels.
; PLAN: r0=36(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=62(y), r7=59(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x), r11=79(y), r12=27(width), r13=71(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 62
LDI r7, 59
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 79
LDI r12, 27
LDI r13, 71
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
