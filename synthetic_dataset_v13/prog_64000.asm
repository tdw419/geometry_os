; DESCRIPTION: Creates a red rectangular region at (397, 171) spanning 59 by 24 pixels.
; PLAN: r0=397(x), r1=171(y), r2=59(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 171
LDI r2, 59
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
