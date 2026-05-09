; DESCRIPTION: Composite: Creates a black rectangular region at (275, 33) spanning 120 by 44 pixels then Renders a orange disk with center (299, 139) and radius 75 then Sets a single black pixel at (198, 221).
; PLAN: r0=275(x), r1=33(y), r2=120(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=139(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=198(x), r11=221(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 33
LDI r2, 120
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 139
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 198
LDI r11, 221
LDI r12, 0x000000
PSET r10, r11, r12
HALT
