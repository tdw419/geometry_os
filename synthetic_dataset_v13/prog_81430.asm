; DESCRIPTION: Renders a red box of size 56x51 starting at (451, 122).
; PLAN: r0=451(x), r1=122(y), r2=56(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 122
LDI r2, 56
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
