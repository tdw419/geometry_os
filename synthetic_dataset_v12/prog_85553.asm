; DESCRIPTION: Composite: Creates a green rectangular region at (171, 146) spanning 42 by 106 pixels then Places a black dot at position (484, 220).
; PLAN: r0=171(x), r1=146(y), r2=42(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=220(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 146
LDI r2, 42
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 220
LDI r7, 0x000000
PSET r5, r6, r7
HALT
