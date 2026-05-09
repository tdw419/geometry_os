; DESCRIPTION: Renders a black box of size 35x10 starting at (366, 112).
; PLAN: r0=366(x), r1=112(y), r2=35(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 112
LDI r2, 35
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
