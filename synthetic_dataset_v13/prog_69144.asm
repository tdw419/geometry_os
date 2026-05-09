; DESCRIPTION: Creates a white rectangular region at (9, 9) spanning 113 by 116 pixels.
; PLAN: r0=9(x), r1=9(y), r2=113(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 9
LDI r2, 113
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
