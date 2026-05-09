; DESCRIPTION: Creates a white rectangular region at (332, 113) spanning 47 by 116 pixels.
; PLAN: r0=332(x), r1=113(y), r2=47(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 113
LDI r2, 47
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
