; DESCRIPTION: Composite: Draws a orange circle centered at (111, 101) with radius 10 then Sets a single orange pixel at (429, 4) then Places a blue 95x48 rectangle at position (294, 115).
; PLAN: r0=111(x), r1=101(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=115(y), r12=95(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 101
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 294
LDI r11, 115
LDI r12, 95
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
