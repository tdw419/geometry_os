; DESCRIPTION: Composite: Creates a red rectangular region at (422, 171) spanning 88 by 79 pixels then Places a white dot at position (306, 185) then Places a blue circle of radius 36 at center (58, 132).
; PLAN: r0=422(x), r1=171(y), r2=88(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=185(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=132(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 171
LDI r2, 88
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 185
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 132
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
