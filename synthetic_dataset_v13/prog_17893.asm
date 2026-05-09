; DESCRIPTION: Composite: Places a cyan dot at position (221, 64) then Draws a purple circle centered at (441, 192) with radius 64 then Draws a black rectangle at (219, 96) with width 25 and height 18.
; PLAN: r0=221(x), r1=64(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=192(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x), r11=96(y), r12=25(width), r13=18(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 64
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 192
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 96
LDI r12, 25
LDI r13, 18
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
