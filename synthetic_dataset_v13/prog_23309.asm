; DESCRIPTION: Composite: Creates a black rectangular region at (149, 134) spanning 64 by 105 pixels then Places a black circle of radius 77 at center (202, 102).
; PLAN: r0=149(x), r1=134(y), r2=64(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=102(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 149
LDI r1, 134
LDI r2, 64
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 102
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
