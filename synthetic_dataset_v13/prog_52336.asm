; DESCRIPTION: Composite: Creates a white rectangular region at (56, 13) spanning 105 by 52 pixels then Places a cyan dot at position (186, 47).
; PLAN: r0=56(x), r1=13(y), r2=105(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=47(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 56
LDI r1, 13
LDI r2, 105
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 47
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
