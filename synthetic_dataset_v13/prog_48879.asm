; DESCRIPTION: Creates a white rectangular region at (360, 140) spanning 34 by 99 pixels.
; PLAN: r0=360(x), r1=140(y), r2=34(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 140
LDI r2, 34
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
