; DESCRIPTION: Renders a white box of size 51x56 starting at (112, 34).
; PLAN: r0=112(x), r1=34(y), r2=51(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 34
LDI r2, 51
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
