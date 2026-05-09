; DESCRIPTION: Composite: Places a white 76x112 rectangle at position (80, 138) then Places a cyan dot at position (18, 88) then Renders a purple disk with center (322, 94) and radius 36.
; PLAN: r0=80(x), r1=138(y), r2=76(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=94(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 138
LDI r2, 76
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 322
LDI r11, 94
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
