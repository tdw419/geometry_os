; DESCRIPTION: Creates a white rectangular region at (86, 102) spanning 113 by 71 pixels.
; PLAN: r0=86(x), r1=102(y), r2=113(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 102
LDI r2, 113
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
