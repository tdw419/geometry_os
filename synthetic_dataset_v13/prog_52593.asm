; DESCRIPTION: Creates a white rectangular region at (419, 54) spanning 70 by 82 pixels.
; PLAN: r0=419(x), r1=54(y), r2=70(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 54
LDI r2, 70
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
