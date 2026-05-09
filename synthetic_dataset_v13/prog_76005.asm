; DESCRIPTION: Renders a white box of size 106x14 starting at (310, 117).
; PLAN: r0=310(x), r1=117(y), r2=106(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 117
LDI r2, 106
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
