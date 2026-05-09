; DESCRIPTION: Renders a yellow box of size 80x115 starting at (11, 122).
; PLAN: r0=11(x), r1=122(y), r2=80(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 122
LDI r2, 80
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
