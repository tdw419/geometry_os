; DESCRIPTION: Creates a white rectangular region at (12, 38) spanning 11 by 105 pixels.
; PLAN: r0=12(x), r1=38(y), r2=11(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 38
LDI r2, 11
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
