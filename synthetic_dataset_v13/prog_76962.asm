; DESCRIPTION: Renders a black box of size 33x92 starting at (17, 129).
; PLAN: r0=17(x), r1=129(y), r2=33(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 129
LDI r2, 33
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
