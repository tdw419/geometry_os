; DESCRIPTION: Renders a white box of size 23x40 starting at (469, 185).
; PLAN: r0=469(x), r1=185(y), r2=23(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 185
LDI r2, 23
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
