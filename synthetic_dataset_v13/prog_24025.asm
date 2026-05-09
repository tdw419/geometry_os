; DESCRIPTION: Composite: Renders a cyan disk with center (291, 28) and radius 14 then Creates a white rectangular region at (235, 166) spanning 79 by 57 pixels then Sets a single white pixel at (211, 38).
; PLAN: r0=291(x), r1=28(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=166(y), r7=79(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x), r11=38(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 28
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 166
LDI r7, 79
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 38
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
