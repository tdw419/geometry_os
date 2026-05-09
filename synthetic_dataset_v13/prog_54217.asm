; DESCRIPTION: Composite: Creates a purple rectangular region at (251, 46) spanning 43 by 47 pixels then Places a green dot at position (347, 254).
; PLAN: r0=251(x), r1=46(y), r2=43(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=254(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 46
LDI r2, 43
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 254
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
