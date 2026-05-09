; DESCRIPTION: Composite: Places a cyan dot at position (239, 184) then Renders a green disk with center (388, 43) and radius 27 then Places a purple line segment connecting (289, 206) to (476, 140).
; PLAN: r0=239(x), r1=184(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=43(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x1), r11=206(y1), r12=476(x2), r13=140(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 184
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 43
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 206
LDI r12, 476
LDI r13, 140
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
