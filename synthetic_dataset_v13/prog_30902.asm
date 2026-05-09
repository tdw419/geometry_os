; DESCRIPTION: Renders a white box of size 97x78 starting at (82, 5).
; PLAN: r0=82(x), r1=5(y), r2=97(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 5
LDI r2, 97
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
