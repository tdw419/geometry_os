; DESCRIPTION: Renders a black box of size 105x61 starting at (108, 181).
; PLAN: r0=108(x), r1=181(y), r2=105(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 181
LDI r2, 105
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
