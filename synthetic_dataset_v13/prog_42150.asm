; DESCRIPTION: Composite: Renders a white disk with center (170, 204) and radius 24 then Sets a single orange pixel at (493, 234) then Creates a orange rectangular region at (425, 76) spanning 56 by 120 pixels.
; PLAN: r0=170(x), r1=204(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=234(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=76(y), r12=56(width), r13=120(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 204
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 234
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 425
LDI r11, 76
LDI r12, 56
LDI r13, 120
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
