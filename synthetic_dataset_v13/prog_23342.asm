; DESCRIPTION: Creates a white rectangular region at (299, 148) spanning 80 by 20 pixels.
; PLAN: r0=299(x), r1=148(y), r2=80(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 148
LDI r2, 80
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
