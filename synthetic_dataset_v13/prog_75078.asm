; DESCRIPTION: Renders a white box of size 73x105 starting at (85, 9).
; PLAN: r0=85(x), r1=9(y), r2=73(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 9
LDI r2, 73
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
