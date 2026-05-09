; DESCRIPTION: Creates a white rectangular region at (326, 29) spanning 88 by 27 pixels.
; PLAN: r0=326(x), r1=29(y), r2=88(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 29
LDI r2, 88
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
