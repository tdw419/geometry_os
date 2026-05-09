; DESCRIPTION: Composite: Creates a magenta rectangular region at (400, 78) spanning 75 by 117 pixels then Places a white dot at position (143, 29) then Places a red circle of radius 11 at center (418, 216).
; PLAN: r0=400(x), r1=78(y), r2=75(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=29(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=418(x), r11=216(y), r12=11(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 78
LDI r2, 75
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 29
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 418
LDI r11, 216
LDI r12, 11
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
