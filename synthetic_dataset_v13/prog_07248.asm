; DESCRIPTION: Renders a yellow box of size 103x89 starting at (203, 121).
; PLAN: r0=203(x), r1=121(y), r2=103(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 121
LDI r2, 103
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
