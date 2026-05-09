; DESCRIPTION: Renders a white box of size 105x69 starting at (20, 33).
; PLAN: r0=20(x), r1=33(y), r2=105(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 33
LDI r2, 105
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
