; DESCRIPTION: Composite: Renders a green disk with center (334, 94) and radius 40 then Places a yellow dot at position (333, 76) then Places a purple line segment connecting (397, 197) to (310, 192).
; PLAN: r0=334(x), r1=94(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=76(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=397(x1), r11=197(y1), r12=310(x2), r13=192(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 94
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 76
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 397
LDI r11, 197
LDI r12, 310
LDI r13, 192
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
