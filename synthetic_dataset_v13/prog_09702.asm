; DESCRIPTION: Renders a yellow box of size 55x43 starting at (17, 27).
; PLAN: r0=17(x), r1=27(y), r2=55(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 27
LDI r2, 55
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
