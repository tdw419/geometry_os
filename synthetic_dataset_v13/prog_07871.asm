; DESCRIPTION: Renders a black box of size 96x10 starting at (17, 99).
; PLAN: r0=17(x), r1=99(y), r2=96(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 99
LDI r2, 96
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
