; DESCRIPTION: Composite: Renders a black box of size 16x114 starting at (238, 119) then Renders a green disk with center (338, 107) and radius 19 then Places a black dot at position (171, 82).
; PLAN: r0=238(x), r1=119(y), r2=16(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=107(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=82(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 119
LDI r2, 16
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 107
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 82
LDI r12, 0x000000
PSET r10, r11, r12
HALT
