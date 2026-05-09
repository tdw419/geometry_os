; DESCRIPTION: Composite: Creates a white rectangular region at (370, 170) spanning 73 by 12 pixels then Places a purple dot at position (113, 236) then Renders a red disk with center (399, 180) and radius 76.
; PLAN: r0=370(x), r1=170(y), r2=73(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=236(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=399(x), r11=180(y), r12=76(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 170
LDI r2, 73
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 236
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 399
LDI r11, 180
LDI r12, 76
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
