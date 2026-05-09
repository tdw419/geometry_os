; DESCRIPTION: Composite: Places a red 72x108 rectangle at position (105, 75) then Creates a purple circular shape at (238, 217) with radius 33 then Places a white dot at position (280, 131).
; PLAN: r0=105(x), r1=75(y), r2=72(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=217(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=131(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 75
LDI r2, 72
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 217
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 131
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
