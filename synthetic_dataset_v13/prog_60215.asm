; DESCRIPTION: Creates a white rectangular region at (326, 139) spanning 100 by 13 pixels.
; PLAN: r0=326(x), r1=139(y), r2=100(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 139
LDI r2, 100
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
