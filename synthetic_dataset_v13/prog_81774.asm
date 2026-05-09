; DESCRIPTION: Creates a red rectangular region at (361, 85) spanning 61 by 106 pixels.
; PLAN: r0=361(x), r1=85(y), r2=61(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 85
LDI r2, 61
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
