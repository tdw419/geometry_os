; DESCRIPTION: Creates a red rectangular region at (426, 155) spanning 65 by 64 pixels.
; PLAN: r0=426(x), r1=155(y), r2=65(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 155
LDI r2, 65
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
