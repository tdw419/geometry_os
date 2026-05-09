; DESCRIPTION: Creates a white rectangular region at (125, 54) spanning 94 by 74 pixels.
; PLAN: r0=125(x), r1=54(y), r2=94(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 54
LDI r2, 94
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
