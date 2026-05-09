; DESCRIPTION: Composite: Places a orange 101x19 rectangle at position (28, 51) then Creates a red circular shape at (276, 126) with radius 26 then Sets a single purple pixel at (497, 171).
; PLAN: r0=28(x), r1=51(y), r2=101(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=126(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x), r11=171(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 51
LDI r2, 101
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 126
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 171
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
