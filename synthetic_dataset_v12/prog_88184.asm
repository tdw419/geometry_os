; DESCRIPTION: Renders a white box of size 97x12 starting at (23, 74).
; PLAN: r0=23(x), r1=74(y), r2=97(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 74
LDI r2, 97
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
