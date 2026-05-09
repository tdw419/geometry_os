; DESCRIPTION: Creates a white rectangular region at (474, 20) spanning 34 by 19 pixels.
; PLAN: r0=474(x), r1=20(y), r2=34(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 20
LDI r2, 34
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
