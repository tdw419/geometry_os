; DESCRIPTION: Renders a black box of size 79x43 starting at (17, 65).
; PLAN: r0=17(x), r1=65(y), r2=79(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 65
LDI r2, 79
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
