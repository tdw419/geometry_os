; DESCRIPTION: Creates a white rectangular region at (396, 143) spanning 90 by 77 pixels.
; PLAN: r0=396(x), r1=143(y), r2=90(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 143
LDI r2, 90
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
