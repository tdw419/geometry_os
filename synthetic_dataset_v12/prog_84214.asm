; DESCRIPTION: Composite: Places a blue 70x74 rectangle at position (374, 141) then Sets a single yellow pixel at (98, 70) then Places a white circle of radius 70 at center (241, 124).
; PLAN: r0=374(x), r1=141(y), r2=70(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=241(x), r11=124(y), r12=70(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 141
LDI r2, 70
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 241
LDI r11, 124
LDI r12, 70
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
