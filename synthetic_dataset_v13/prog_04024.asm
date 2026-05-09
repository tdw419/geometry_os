; DESCRIPTION: Renders a white box of size 119x69 starting at (98, 156).
; PLAN: r0=98(x), r1=156(y), r2=119(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 156
LDI r2, 119
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
