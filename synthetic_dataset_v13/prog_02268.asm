; DESCRIPTION: Renders a yellow box of size 69x58 starting at (324, 125).
; PLAN: r0=324(x), r1=125(y), r2=69(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 125
LDI r2, 69
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
