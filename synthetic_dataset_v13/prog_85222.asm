; DESCRIPTION: Creates a white rectangular region at (67, 111) spanning 11 by 30 pixels.
; PLAN: r0=67(x), r1=111(y), r2=11(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 111
LDI r2, 11
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
