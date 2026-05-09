; DESCRIPTION: Composite: Renders a white disk with center (157, 151) and radius 55 then Places a orange dot at position (183, 244) then Renders a green line between points (356, 49) and (457, 242).
; PLAN: r0=157(x), r1=151(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=244(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=356(x1), r11=49(y1), r12=457(x2), r13=242(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 151
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 244
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 356
LDI r11, 49
LDI r12, 457
LDI r13, 242
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
