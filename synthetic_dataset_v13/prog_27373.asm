; DESCRIPTION: Creates a red rectangular region at (361, 21) spanning 71 by 102 pixels.
; PLAN: r0=361(x), r1=21(y), r2=71(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 21
LDI r2, 71
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
