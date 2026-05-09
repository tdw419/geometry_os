; DESCRIPTION: Renders a yellow box of size 106x108 starting at (338, 56).
; PLAN: r0=338(x), r1=56(y), r2=106(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 56
LDI r2, 106
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
