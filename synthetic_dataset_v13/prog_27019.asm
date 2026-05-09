; DESCRIPTION: Composite: Creates a black rectangular region at (220, 152) spanning 119 by 77 pixels then Places a white dot at position (94, 159).
; PLAN: r0=220(x), r1=152(y), r2=119(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=159(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 152
LDI r2, 119
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 159
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
