; DESCRIPTION: Composite: Creates a red rectangular region at (207, 82) spanning 53 by 39 pixels then Places a white dot at position (349, 248) then Places a yellow circle of radius 60 at center (303, 155).
; PLAN: r0=207(x), r1=82(y), r2=53(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=248(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=303(x), r11=155(y), r12=60(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 82
LDI r2, 53
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 248
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 303
LDI r11, 155
LDI r12, 60
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
