; DESCRIPTION: Renders a white box of size 34x69 starting at (366, 35).
; PLAN: r0=366(x), r1=35(y), r2=34(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 35
LDI r2, 34
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
