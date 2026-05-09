; DESCRIPTION: Creates a red rectangular region at (359, 159) spanning 71 by 96 pixels.
; PLAN: r0=359(x), r1=159(y), r2=71(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 159
LDI r2, 71
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
