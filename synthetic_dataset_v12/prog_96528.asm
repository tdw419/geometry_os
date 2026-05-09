; DESCRIPTION: Renders a white box of size 119x22 starting at (123, 77).
; PLAN: r0=123(x), r1=77(y), r2=119(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 77
LDI r2, 119
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
