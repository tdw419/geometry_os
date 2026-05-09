; DESCRIPTION: Composite: Draws a purple circle centered at (195, 186) with radius 42 then Renders a purple box of size 10x94 starting at (419, 113) then Sets a single orange pixel at (261, 172).
; PLAN: r0=195(x), r1=186(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=113(y), r7=10(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=172(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 186
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 113
LDI r7, 10
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 172
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
