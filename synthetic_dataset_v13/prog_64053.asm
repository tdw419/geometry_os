; DESCRIPTION: Creates a white rectangular region at (205, 28) spanning 66 by 90 pixels.
; PLAN: r0=205(x), r1=28(y), r2=66(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 28
LDI r2, 66
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
