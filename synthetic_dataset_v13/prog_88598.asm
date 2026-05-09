; DESCRIPTION: Creates a white rectangular region at (10, 39) spanning 84 by 70 pixels.
; PLAN: r0=10(x), r1=39(y), r2=84(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 39
LDI r2, 84
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
