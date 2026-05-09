; DESCRIPTION: Composite: Creates a cyan rectangular region at (171, 96) spanning 73 by 115 pixels then Places a cyan dot at position (86, 220).
; PLAN: r0=171(x), r1=96(y), r2=73(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 96
LDI r2, 73
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
