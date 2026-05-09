; DESCRIPTION: Composite: Creates a red rectangular region at (492, 11) spanning 12 by 35 pixels then Places a white dot at position (440, 83) then Renders a green disk with center (136, 132) and radius 53.
; PLAN: r0=492(x), r1=11(y), r2=12(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=83(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=132(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 11
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 83
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 136
LDI r11, 132
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
