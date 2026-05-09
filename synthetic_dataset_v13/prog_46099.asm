; DESCRIPTION: Composite: Places a yellow 56x97 rectangle at position (437, 51) then Places a white circle of radius 77 at center (230, 113) then Sets a single green pixel at (463, 93).
; PLAN: r0=437(x), r1=51(y), r2=56(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=113(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x), r11=93(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 437
LDI r1, 51
LDI r2, 56
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 113
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 93
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
