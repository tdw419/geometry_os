; DESCRIPTION: Composite: Creates a magenta rectangular region at (178, 159) spanning 105 by 56 pixels then Sets a single white pixel at (265, 159) then Places a cyan circle of radius 14 at center (340, 235).
; PLAN: r0=178(x), r1=159(y), r2=105(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=159(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=235(y), r12=14(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 159
LDI r2, 105
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 159
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 235
LDI r12, 14
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
