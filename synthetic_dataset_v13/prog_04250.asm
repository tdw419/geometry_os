; DESCRIPTION: Renders a red box of size 114x51 starting at (373, 105).
; PLAN: r0=373(x), r1=105(y), r2=114(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 105
LDI r2, 114
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
