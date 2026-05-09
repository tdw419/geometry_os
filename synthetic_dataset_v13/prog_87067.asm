; DESCRIPTION: Creates a white rectangular region at (9, 38) spanning 56 by 85 pixels.
; PLAN: r0=9(x), r1=38(y), r2=56(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 38
LDI r2, 56
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
