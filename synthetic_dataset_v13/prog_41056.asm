; DESCRIPTION: Renders a white box of size 62x90 starting at (426, 104).
; PLAN: r0=426(x), r1=104(y), r2=62(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 104
LDI r2, 62
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
