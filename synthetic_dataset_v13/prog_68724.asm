; DESCRIPTION: Composite: Creates a yellow rectangular region at (93, 64) spanning 65 by 110 pixels then Places a red circle of radius 32 at center (422, 99).
; PLAN: r0=93(x), r1=64(y), r2=65(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=99(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 64
LDI r2, 65
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 99
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
