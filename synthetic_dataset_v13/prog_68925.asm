; DESCRIPTION: Renders a white box of size 84x67 starting at (153, 106).
; PLAN: r0=153(x), r1=106(y), r2=84(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 106
LDI r2, 84
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
