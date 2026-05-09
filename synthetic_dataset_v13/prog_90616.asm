; DESCRIPTION: Composite: Creates a green rectangular region at (230, 75) spanning 20 by 81 pixels then Places a purple dot at position (384, 251) then Creates a cyan circular shape at (406, 101) with radius 52.
; PLAN: r0=230(x), r1=75(y), r2=20(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=251(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=406(x), r11=101(y), r12=52(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 75
LDI r2, 20
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 251
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 406
LDI r11, 101
LDI r12, 52
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
