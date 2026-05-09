; DESCRIPTION: Creates a white rectangular region at (304, 20) spanning 94 by 52 pixels.
; PLAN: r0=304(x), r1=20(y), r2=94(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 20
LDI r2, 94
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
