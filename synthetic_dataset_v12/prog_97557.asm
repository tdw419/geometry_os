; DESCRIPTION: Renders a white box of size 105x74 starting at (153, 162).
; PLAN: r0=153(x), r1=162(y), r2=105(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 162
LDI r2, 105
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
