; DESCRIPTION: Composite: Sets a single purple pixel at (383, 244) then Places a magenta circle of radius 70 at center (439, 128) then Creates a orange rectangular region at (37, 219) spanning 71 by 23 pixels.
; PLAN: r0=383(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=128(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=37(x), r11=219(y), r12=71(width), r13=23(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 128
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 37
LDI r11, 219
LDI r12, 71
LDI r13, 23
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
