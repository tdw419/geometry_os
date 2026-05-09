; DESCRIPTION: Composite: Renders a blue line between points (459, 173) and (204, 205) then Places a green dot at position (293, 234) then Renders a white disk with center (364, 168) and radius 64.
; PLAN: r0=459(x1), r1=173(y1), r2=204(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=234(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=364(x), r11=168(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 173
LDI r2, 204
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 234
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 364
LDI r11, 168
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
