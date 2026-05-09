; DESCRIPTION: Renders a white box of size 56x95 starting at (426, 25).
; PLAN: r0=426(x), r1=25(y), r2=56(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 25
LDI r2, 56
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
