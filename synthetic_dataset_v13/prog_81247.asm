; DESCRIPTION: Creates a red rectangular region at (324, 11) spanning 11 by 62 pixels.
; PLAN: r0=324(x), r1=11(y), r2=11(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 11
LDI r2, 11
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
