; DESCRIPTION: Renders a white box of size 19x22 starting at (11, 161).
; PLAN: r0=11(x), r1=161(y), r2=19(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 161
LDI r2, 19
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
