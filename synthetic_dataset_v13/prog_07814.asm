; DESCRIPTION: Composite: Places a orange dot at position (121, 255) then Renders a white disk with center (183, 99) and radius 47 then Places a red line segment connecting (446, 95) to (188, 72).
; PLAN: r0=121(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=99(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x1), r11=95(y1), r12=188(x2), r13=72(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 255
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 183
LDI r6, 99
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 95
LDI r12, 188
LDI r13, 72
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
