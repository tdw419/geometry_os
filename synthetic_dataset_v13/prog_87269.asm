; DESCRIPTION: Composite: Renders a green disk with center (222, 139) and radius 21 then Sets a single green pixel at (151, 15) then Places a green line segment connecting (32, 13) to (466, 48).
; PLAN: r0=222(x), r1=139(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=15(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=13(y1), r12=466(x2), r13=48(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 139
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 15
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 32
LDI r11, 13
LDI r12, 466
LDI r13, 48
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
