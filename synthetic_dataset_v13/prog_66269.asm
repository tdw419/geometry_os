; DESCRIPTION: Renders a white box of size 51x100 starting at (61, 129).
; PLAN: r0=61(x), r1=129(y), r2=51(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 129
LDI r2, 51
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
