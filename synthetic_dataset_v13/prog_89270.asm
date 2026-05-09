; DESCRIPTION: Composite: Renders a green disk with center (371, 237) and radius 11 then Sets a single white pixel at (307, 91) then Places a white line segment connecting (463, 192) to (59, 181).
; PLAN: r0=371(x), r1=237(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=91(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=463(x1), r11=192(y1), r12=59(x2), r13=181(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 237
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 91
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 463
LDI r11, 192
LDI r12, 59
LDI r13, 181
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
