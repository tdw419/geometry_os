; DESCRIPTION: Creates a red rectangular region at (477, 52) spanning 33 by 11 pixels.
; PLAN: r0=477(x), r1=52(y), r2=33(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 52
LDI r2, 33
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
