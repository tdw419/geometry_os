; DESCRIPTION: Renders a white box of size 115x119 starting at (167, 117).
; PLAN: r0=167(x), r1=117(y), r2=115(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 117
LDI r2, 115
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
