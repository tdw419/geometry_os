; DESCRIPTION: Creates a white rectangular region at (426, 38) spanning 14 by 40 pixels.
; PLAN: r0=426(x), r1=38(y), r2=14(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 38
LDI r2, 14
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
