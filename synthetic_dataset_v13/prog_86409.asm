; DESCRIPTION: Creates a white rectangular region at (426, 151) spanning 65 by 60 pixels.
; PLAN: r0=426(x), r1=151(y), r2=65(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 151
LDI r2, 65
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
