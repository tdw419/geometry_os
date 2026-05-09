; DESCRIPTION: Creates a red rectangular region at (358, 19) spanning 31 by 66 pixels.
; PLAN: r0=358(x), r1=19(y), r2=31(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 19
LDI r2, 31
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
