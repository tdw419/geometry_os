; DESCRIPTION: Composite: Sets a single white pixel at (301, 67) then Creates a purple circular shape at (380, 131) with radius 77 then Places a black 96x86 rectangle at position (382, 49).
; PLAN: r0=301(x), r1=67(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=131(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=49(y), r12=96(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 67
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 131
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 49
LDI r12, 96
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
