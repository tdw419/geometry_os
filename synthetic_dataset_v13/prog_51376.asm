; DESCRIPTION: Composite: Creates a purple rectangular region at (34, 14) spanning 11 by 18 pixels then Places a white dot at position (277, 110) then Renders a green disk with center (95, 112) and radius 74.
; PLAN: r0=34(x), r1=14(y), r2=11(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=110(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=95(x), r11=112(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 14
LDI r2, 11
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 110
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 95
LDI r11, 112
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
