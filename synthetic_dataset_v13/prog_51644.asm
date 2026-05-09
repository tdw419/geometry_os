; DESCRIPTION: Renders a white box of size 74x26 starting at (103, 123).
; PLAN: r0=103(x), r1=123(y), r2=74(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 123
LDI r2, 74
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
