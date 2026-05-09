; DESCRIPTION: Creates a white rectangular region at (86, 125) spanning 70 by 24 pixels.
; PLAN: r0=86(x), r1=125(y), r2=70(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 125
LDI r2, 70
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
