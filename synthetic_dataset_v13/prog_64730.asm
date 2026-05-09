; DESCRIPTION: Creates a white rectangular region at (178, 173) spanning 114 by 77 pixels.
; PLAN: r0=178(x), r1=173(y), r2=114(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 173
LDI r2, 114
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
