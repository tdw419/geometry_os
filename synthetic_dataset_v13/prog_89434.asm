; DESCRIPTION: Creates a white rectangular region at (326, 125) spanning 74 by 62 pixels.
; PLAN: r0=326(x), r1=125(y), r2=74(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 125
LDI r2, 74
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
