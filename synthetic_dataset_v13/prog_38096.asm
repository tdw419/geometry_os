; DESCRIPTION: Composite: Places a yellow 76x120 rectangle at position (172, 61) then Places a yellow circle of radius 55 at center (273, 170) then Sets a single white pixel at (119, 146).
; PLAN: r0=172(x), r1=61(y), r2=76(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=170(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x), r11=146(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 172
LDI r1, 61
LDI r2, 76
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 170
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 146
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
