; DESCRIPTION: Composite: Places a red 61x93 rectangle at position (149, 104) then Places a white circle of radius 31 at center (216, 171) then Sets a single white pixel at (106, 114).
; PLAN: r0=149(x), r1=104(y), r2=61(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=171(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x), r11=114(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 104
LDI r2, 61
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 171
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 114
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
