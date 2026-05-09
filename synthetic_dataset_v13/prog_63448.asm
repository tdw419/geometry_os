; DESCRIPTION: Renders a white box of size 22x76 starting at (138, 165).
; PLAN: r0=138(x), r1=165(y), r2=22(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 165
LDI r2, 22
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
