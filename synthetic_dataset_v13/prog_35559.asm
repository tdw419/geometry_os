; DESCRIPTION: Renders a white box of size 48x119 starting at (11, 112).
; PLAN: r0=11(x), r1=112(y), r2=48(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 112
LDI r2, 48
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
