; DESCRIPTION: Creates a white rectangular region at (182, 77) spanning 113 by 68 pixels.
; PLAN: r0=182(x), r1=77(y), r2=113(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 77
LDI r2, 113
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
