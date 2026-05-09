; DESCRIPTION: Creates a white rectangular region at (182, 1) spanning 75 by 72 pixels.
; PLAN: r0=182(x), r1=1(y), r2=75(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 1
LDI r2, 75
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
