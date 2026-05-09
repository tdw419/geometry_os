; DESCRIPTION: Creates a white rectangular region at (15, 67) spanning 11 by 94 pixels.
; PLAN: r0=15(x), r1=67(y), r2=11(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 67
LDI r2, 11
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
