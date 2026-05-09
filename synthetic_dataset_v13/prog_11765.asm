; DESCRIPTION: Renders a white box of size 49x43 starting at (356, 86).
; PLAN: r0=356(x), r1=86(y), r2=49(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 86
LDI r2, 49
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
