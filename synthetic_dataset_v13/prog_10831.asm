; DESCRIPTION: Creates a white rectangular region at (424, 19) spanning 13 by 85 pixels.
; PLAN: r0=424(x), r1=19(y), r2=13(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 19
LDI r2, 13
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
