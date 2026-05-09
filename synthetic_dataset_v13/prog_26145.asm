; DESCRIPTION: Renders a orange box of size 115x51 starting at (219, 49).
; PLAN: r0=219(x), r1=49(y), r2=115(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 49
LDI r2, 115
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
