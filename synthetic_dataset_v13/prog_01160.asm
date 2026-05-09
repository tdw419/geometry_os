; DESCRIPTION: Renders a white box of size 51x100 starting at (303, 135).
; PLAN: r0=303(x), r1=135(y), r2=51(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 135
LDI r2, 51
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
