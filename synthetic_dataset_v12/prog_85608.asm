; DESCRIPTION: Creates a white rectangular region at (43, 26) spanning 107 by 113 pixels.
; PLAN: r0=43(x), r1=26(y), r2=107(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 26
LDI r2, 107
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
