; DESCRIPTION: Renders a white box of size 70x12 starting at (306, 155).
; PLAN: r0=306(x), r1=155(y), r2=70(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 155
LDI r2, 70
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
