; DESCRIPTION: Composite: Renders a green disk with center (148, 81) and radius 49 then Places a white dot at position (102, 16) then Draws a white rectangle at (306, 211) with width 89 and height 34.
; PLAN: r0=148(x), r1=81(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=211(y), r12=89(width), r13=34(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 81
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 306
LDI r11, 211
LDI r12, 89
LDI r13, 34
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
