; DESCRIPTION: Composite: Creates a red rectangular region at (327, 7) spanning 63 by 57 pixels then Sets a single white pixel at (204, 70).
; PLAN: r0=327(x), r1=7(y), r2=63(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=70(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 7
LDI r2, 63
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 70
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
