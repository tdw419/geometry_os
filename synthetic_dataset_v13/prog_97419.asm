; DESCRIPTION: Composite: Creates a magenta rectangular region at (348, 62) spanning 112 by 57 pixels then Renders a black disk with center (75, 201) and radius 37 then Places a cyan dot at position (219, 3).
; PLAN: r0=348(x), r1=62(y), r2=112(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=201(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x), r11=3(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 62
LDI r2, 112
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 201
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 3
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
