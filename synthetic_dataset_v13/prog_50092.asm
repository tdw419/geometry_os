; DESCRIPTION: Composite: Renders a orange line between points (358, 251) and (128, 247) then Places a black 120x57 rectangle at position (280, 21) then Sets a single orange pixel at (364, 181).
; PLAN: r0=358(x1), r1=251(y1), r2=128(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=21(y), r7=120(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=181(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 251
LDI r2, 128
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 21
LDI r7, 120
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 181
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
