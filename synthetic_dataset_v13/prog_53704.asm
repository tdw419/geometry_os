; DESCRIPTION: Composite: Creates a black rectangular region at (250, 121) spanning 50 by 85 pixels then Places a white dot at position (317, 94).
; PLAN: r0=250(x), r1=121(y), r2=50(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=94(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 121
LDI r2, 50
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 94
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
