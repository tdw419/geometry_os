; DESCRIPTION: Creates a red rectangular region at (426, 72) spanning 15 by 108 pixels.
; PLAN: r0=426(x), r1=72(y), r2=15(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 72
LDI r2, 15
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
