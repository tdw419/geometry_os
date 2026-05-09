; DESCRIPTION: Composite: Places a yellow dot at position (386, 211) then Creates a purple circular shape at (96, 86) with radius 52 then Places a black 97x96 rectangle at position (346, 61).
; PLAN: r0=386(x), r1=211(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=86(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x), r11=61(y), r12=97(width), r13=96(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 211
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 96
LDI r6, 86
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 61
LDI r12, 97
LDI r13, 96
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
