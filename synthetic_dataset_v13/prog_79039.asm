; DESCRIPTION: Renders a black box of size 96x112 starting at (110, 56).
; PLAN: r0=110(x), r1=56(y), r2=96(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 56
LDI r2, 96
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
