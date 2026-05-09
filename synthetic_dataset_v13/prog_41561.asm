; DESCRIPTION: Creates a red rectangular region at (287, 172) spanning 19 by 72 pixels.
; PLAN: r0=287(x), r1=172(y), r2=19(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 172
LDI r2, 19
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
