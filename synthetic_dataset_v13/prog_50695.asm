; DESCRIPTION: Composite: Draws a green circle centered at (262, 53) with radius 31 then Places a cyan dot at position (429, 224) then Places a green 105x26 rectangle at position (60, 216).
; PLAN: r0=262(x), r1=53(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=224(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=216(y), r12=105(width), r13=26(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 53
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 224
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 60
LDI r11, 216
LDI r12, 105
LDI r13, 26
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
