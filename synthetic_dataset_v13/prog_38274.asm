; DESCRIPTION: Composite: Creates a yellow rectangular region at (27, 195) spanning 61 by 23 pixels then Sets a single yellow pixel at (419, 196) then Renders a purple disk with center (407, 53) and radius 16.
; PLAN: r0=27(x), r1=195(y), r2=61(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=196(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=53(y), r12=16(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 195
LDI r2, 61
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 196
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 407
LDI r11, 53
LDI r12, 16
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
