; DESCRIPTION: Creates a red rectangular region at (183, 20) spanning 11 by 15 pixels.
; PLAN: r0=183(x), r1=20(y), r2=11(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 20
LDI r2, 11
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
