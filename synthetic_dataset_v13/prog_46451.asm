; DESCRIPTION: Composite: Creates a yellow rectangular region at (163, 115) spanning 21 by 41 pixels then Places a green dot at position (474, 243).
; PLAN: r0=163(x), r1=115(y), r2=21(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=243(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 115
LDI r2, 21
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 243
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
