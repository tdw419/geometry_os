; DESCRIPTION: Renders a white box of size 13x13 starting at (488, 22).
; PLAN: r0=488(x), r1=22(y), r2=13(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 22
LDI r2, 13
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
