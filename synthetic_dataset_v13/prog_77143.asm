; DESCRIPTION: Composite: Renders a white disk with center (300, 197) and radius 29 then Sets a single purple pixel at (164, 232) then Renders a green line between points (386, 97) and (261, 244).
; PLAN: r0=300(x), r1=197(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=232(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=386(x1), r11=97(y1), r12=261(x2), r13=244(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 197
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 232
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 386
LDI r11, 97
LDI r12, 261
LDI r13, 244
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
