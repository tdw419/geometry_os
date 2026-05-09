; DESCRIPTION: Composite: Renders a white disk with center (100, 169) and radius 76 then Sets a single yellow pixel at (422, 231) then Creates a cyan rectangular region at (211, 195) spanning 83 by 11 pixels.
; PLAN: r0=100(x), r1=169(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=231(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=195(y), r12=83(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 169
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 231
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 211
LDI r11, 195
LDI r12, 83
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
