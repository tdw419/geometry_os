; DESCRIPTION: Renders a white box of size 73x22 starting at (322, 184).
; PLAN: r0=322(x), r1=184(y), r2=73(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 184
LDI r2, 73
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
