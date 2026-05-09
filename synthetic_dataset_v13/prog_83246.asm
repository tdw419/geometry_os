; DESCRIPTION: Creates a red rectangular region at (407, 6) spanning 57 by 97 pixels.
; PLAN: r0=407(x), r1=6(y), r2=57(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 6
LDI r2, 57
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
