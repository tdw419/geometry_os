; DESCRIPTION: Renders a white box of size 28x26 starting at (426, 35).
; PLAN: r0=426(x), r1=35(y), r2=28(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 35
LDI r2, 28
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
