; DESCRIPTION: Renders a yellow box of size 86x58 starting at (299, 122).
; PLAN: r0=299(x), r1=122(y), r2=86(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 122
LDI r2, 86
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
