; DESCRIPTION: Creates a red rectangular region at (361, 12) spanning 57 by 76 pixels.
; PLAN: r0=361(x), r1=12(y), r2=57(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 12
LDI r2, 57
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
