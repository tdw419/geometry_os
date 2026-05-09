; DESCRIPTION: Creates a white rectangular region at (29, 111) spanning 60 by 114 pixels.
; PLAN: r0=29(x), r1=111(y), r2=60(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 111
LDI r2, 60
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
