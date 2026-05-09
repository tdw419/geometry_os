; DESCRIPTION: Composite: Renders a black box of size 78x76 starting at (387, 64) then Sets a single orange pixel at (392, 201) then Places a orange circle of radius 54 at center (452, 64).
; PLAN: r0=387(x), r1=64(y), r2=78(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=201(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=452(x), r11=64(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 64
LDI r2, 78
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 201
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 452
LDI r11, 64
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
