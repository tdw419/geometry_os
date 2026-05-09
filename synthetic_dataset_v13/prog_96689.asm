; DESCRIPTION: Composite: Renders a purple disk with center (320, 66) and radius 53 then Sets a single yellow pixel at (142, 143) then Renders a yellow box of size 65x48 starting at (195, 68).
; PLAN: r0=320(x), r1=66(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=143(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=68(y), r12=65(width), r13=48(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 66
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 143
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 195
LDI r11, 68
LDI r12, 65
LDI r13, 48
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
