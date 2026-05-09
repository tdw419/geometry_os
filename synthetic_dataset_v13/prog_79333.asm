; DESCRIPTION: Composite: Renders a green disk with center (422, 122) and radius 42 then Creates a orange rectangular region at (165, 85) spanning 64 by 74 pixels then Places a purple dot at position (346, 185).
; PLAN: r0=422(x), r1=122(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=85(y), r7=64(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=185(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 122
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 85
LDI r7, 64
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 185
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
