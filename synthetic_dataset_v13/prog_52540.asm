; DESCRIPTION: Creates a red rectangular region at (234, 183) spanning 107 by 31 pixels.
; PLAN: r0=234(x), r1=183(y), r2=107(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 183
LDI r2, 107
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
