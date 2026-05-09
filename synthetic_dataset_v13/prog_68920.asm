; DESCRIPTION: Composite: Places a blue 73x37 rectangle at position (374, 215) then Creates a yellow circular shape at (430, 171) with radius 44 then Sets a single orange pixel at (289, 223).
; PLAN: r0=374(x), r1=215(y), r2=73(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=171(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=223(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 215
LDI r2, 73
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 171
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 223
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
