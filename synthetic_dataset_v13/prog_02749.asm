; DESCRIPTION: Composite: Creates a orange rectangular region at (419, 34) spanning 44 by 29 pixels then Places a blue circle of radius 45 at center (275, 180) then Sets a single green pixel at (15, 64).
; PLAN: r0=419(x), r1=34(y), r2=44(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=180(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=15(x), r11=64(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 34
LDI r2, 44
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 180
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 15
LDI r11, 64
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
