; DESCRIPTION: Renders a white box of size 54x119 starting at (141, 46).
; PLAN: r0=141(x), r1=46(y), r2=54(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 46
LDI r2, 54
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
