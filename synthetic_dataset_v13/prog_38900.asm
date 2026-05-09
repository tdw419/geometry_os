; DESCRIPTION: Composite: Creates a purple rectangular region at (401, 122) spanning 34 by 75 pixels then Places a yellow circle of radius 24 at center (286, 194) then Sets a single white pixel at (498, 142).
; PLAN: r0=401(x), r1=122(y), r2=34(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=194(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=142(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 122
LDI r2, 34
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 194
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 142
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
