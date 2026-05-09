; DESCRIPTION: Composite: Renders a white disk with center (162, 127) and radius 14 then Places a red 16x51 rectangle at position (438, 114) then Places a red dot at position (227, 188).
; PLAN: r0=162(x), r1=127(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=114(y), r7=16(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=188(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 162
LDI r1, 127
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 114
LDI r7, 16
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 188
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
