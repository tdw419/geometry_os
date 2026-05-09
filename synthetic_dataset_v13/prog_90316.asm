; DESCRIPTION: Composite: Creates a purple rectangular region at (8, 42) spanning 80 by 91 pixels then Draws a black circle centered at (409, 82) with radius 56 then Sets a single purple pixel at (40, 142).
; PLAN: r0=8(x), r1=42(y), r2=80(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=82(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=142(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 8
LDI r1, 42
LDI r2, 80
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 82
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 142
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
