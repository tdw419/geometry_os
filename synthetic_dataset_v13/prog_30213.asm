; DESCRIPTION: Composite: Renders a magenta disk with center (478, 157) and radius 30 then Places a white dot at position (254, 169) then Renders a cyan line between points (166, 135) and (38, 28).
; PLAN: r0=478(x), r1=157(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=166(x1), r11=135(y1), r12=38(x2), r13=28(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 157
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 166
LDI r11, 135
LDI r12, 38
LDI r13, 28
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
