; DESCRIPTION: Composite: Creates a black circular shape at (22, 69) with radius 19 then Places a orange dot at position (255, 215).
; PLAN: r0=22(x), r1=69(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=215(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 69
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 215
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
