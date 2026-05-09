; DESCRIPTION: Composite: Creates a yellow circular shape at (293, 181) with radius 19 then Places a magenta 82x119 rectangle at position (70, 10) then Sets a single orange pixel at (308, 98).
; PLAN: r0=293(x), r1=181(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=10(y), r7=82(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=98(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 181
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 10
LDI r7, 82
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 98
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
