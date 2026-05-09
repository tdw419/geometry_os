; DESCRIPTION: Creates a red rectangular region at (381, 171) spanning 36 by 38 pixels.
; PLAN: r0=381(x), r1=171(y), r2=36(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 171
LDI r2, 36
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
