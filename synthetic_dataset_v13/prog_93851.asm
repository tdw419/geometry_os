; DESCRIPTION: Renders a orange box of size 49x51 starting at (456, 11).
; PLAN: r0=456(x), r1=11(y), r2=49(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 11
LDI r2, 49
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
