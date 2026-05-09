; DESCRIPTION: Creates a red rectangular region at (407, 33) spanning 76 by 57 pixels.
; PLAN: r0=407(x), r1=33(y), r2=76(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 33
LDI r2, 76
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
