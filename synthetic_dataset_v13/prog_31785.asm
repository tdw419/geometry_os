; DESCRIPTION: Renders a white box of size 28x39 starting at (158, 172).
; PLAN: r0=158(x), r1=172(y), r2=28(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 172
LDI r2, 28
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
