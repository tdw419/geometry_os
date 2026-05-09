; DESCRIPTION: Creates a red rectangular region at (397, 113) spanning 100 by 100 pixels.
; PLAN: r0=397(x), r1=113(y), r2=100(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 113
LDI r2, 100
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
