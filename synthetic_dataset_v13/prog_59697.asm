; DESCRIPTION: Composite: Creates a white rectangular region at (78, 70) spanning 42 by 38 pixels then Places a magenta dot at position (467, 223).
; PLAN: r0=78(x), r1=70(y), r2=42(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=223(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 70
LDI r2, 42
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 223
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
