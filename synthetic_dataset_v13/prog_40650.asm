; DESCRIPTION: Renders a white box of size 84x49 starting at (381, 9).
; PLAN: r0=381(x), r1=9(y), r2=84(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 9
LDI r2, 84
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
