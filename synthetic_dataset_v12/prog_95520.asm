; DESCRIPTION: Composite: Creates a red rectangular region at (318, 7) spanning 57 by 115 pixels then Places a white dot at position (280, 193).
; PLAN: r0=318(x), r1=7(y), r2=57(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=193(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 7
LDI r2, 57
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 193
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
