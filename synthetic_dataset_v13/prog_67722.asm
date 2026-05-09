; DESCRIPTION: Creates a white rectangular region at (364, 86) spanning 18 by 94 pixels.
; PLAN: r0=364(x), r1=86(y), r2=18(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 86
LDI r2, 18
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
