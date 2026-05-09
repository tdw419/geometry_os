; DESCRIPTION: Renders a yellow box of size 69x17 starting at (258, 77).
; PLAN: r0=258(x), r1=77(y), r2=69(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 77
LDI r2, 69
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
