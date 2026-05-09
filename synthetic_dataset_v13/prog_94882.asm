; DESCRIPTION: Creates a white rectangular region at (429, 84) spanning 53 by 87 pixels.
; PLAN: r0=429(x), r1=84(y), r2=53(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 84
LDI r2, 53
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
