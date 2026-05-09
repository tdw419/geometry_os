; DESCRIPTION: Composite: Places a black circle of radius 26 at center (324, 97) then Creates a purple rectangular region at (141, 75) spanning 71 by 16 pixels.
; PLAN: r0=324(x), r1=97(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=75(y), r7=71(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 97
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 75
LDI r7, 71
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
