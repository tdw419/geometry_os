; DESCRIPTION: Creates a black rectangular region at (426, 151) spanning 24 by 90 pixels.
; PLAN: r0=426(x), r1=151(y), r2=24(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 151
LDI r2, 24
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
