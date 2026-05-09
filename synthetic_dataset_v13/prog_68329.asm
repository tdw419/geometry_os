; DESCRIPTION: Creates a white rectangular region at (344, 2) spanning 19 by 48 pixels.
; PLAN: r0=344(x), r1=2(y), r2=19(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 2
LDI r2, 19
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
