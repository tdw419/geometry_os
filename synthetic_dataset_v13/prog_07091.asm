; DESCRIPTION: Composite: Creates a red rectangular region at (231, 110) spanning 84 by 99 pixels then Renders a purple disk with center (286, 159) and radius 64 then Places a black dot at position (415, 115).
; PLAN: r0=231(x), r1=110(y), r2=84(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=159(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=115(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 110
LDI r2, 84
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 159
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 115
LDI r12, 0x000000
PSET r10, r11, r12
HALT
