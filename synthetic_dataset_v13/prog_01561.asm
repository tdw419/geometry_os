; DESCRIPTION: Creates a white rectangular region at (12, 13) spanning 97 by 117 pixels.
; PLAN: r0=12(x), r1=13(y), r2=97(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 13
LDI r2, 97
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
