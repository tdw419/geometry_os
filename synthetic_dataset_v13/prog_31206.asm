; DESCRIPTION: Composite: Places a yellow 117x103 rectangle at position (146, 53) then Sets a single orange pixel at (89, 247) then Places a white circle of radius 56 at center (414, 193).
; PLAN: r0=146(x), r1=53(y), r2=117(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=247(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=193(y), r12=56(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 53
LDI r2, 117
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 247
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 414
LDI r11, 193
LDI r12, 56
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
