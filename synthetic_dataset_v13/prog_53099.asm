; DESCRIPTION: Creates a white rectangular region at (78, 63) spanning 29 by 38 pixels.
; PLAN: r0=78(x), r1=63(y), r2=29(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 63
LDI r2, 29
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
