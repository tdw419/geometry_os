; DESCRIPTION: Composite: Creates a black rectangular region at (225, 160) spanning 94 by 51 pixels then Places a green dot at position (323, 225).
; PLAN: r0=225(x), r1=160(y), r2=94(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=225(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 160
LDI r2, 94
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 225
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
