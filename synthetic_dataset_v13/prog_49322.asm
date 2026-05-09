; DESCRIPTION: Composite: Renders a green line between points (325, 15) and (397, 167) then Renders a red disk with center (93, 96) and radius 21 then Places a red dot at position (175, 166).
; PLAN: r0=325(x1), r1=15(y1), r2=397(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=96(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x), r11=166(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 15
LDI r2, 397
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 96
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 166
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
