; DESCRIPTION: Renders a white box of size 43x82 starting at (455, 22).
; PLAN: r0=455(x), r1=22(y), r2=43(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 22
LDI r2, 43
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
