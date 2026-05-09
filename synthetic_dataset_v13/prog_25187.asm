; DESCRIPTION: Creates a red rectangular region at (204, 97) spanning 113 by 60 pixels.
; PLAN: r0=204(x), r1=97(y), r2=113(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 97
LDI r2, 113
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
