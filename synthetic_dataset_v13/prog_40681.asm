; DESCRIPTION: Renders a white box of size 56x83 starting at (6, 34).
; PLAN: r0=6(x), r1=34(y), r2=56(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 34
LDI r2, 56
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
