; DESCRIPTION: Composite: Renders a yellow box of size 60x31 starting at (186, 85) then Sets a single black pixel at (441, 250) then Places a orange circle of radius 66 at center (436, 174).
; PLAN: r0=186(x), r1=85(y), r2=60(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=250(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=436(x), r11=174(y), r12=66(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 85
LDI r2, 60
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 250
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 436
LDI r11, 174
LDI r12, 66
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
