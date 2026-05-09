; DESCRIPTION: Renders a yellow box of size 86x19 starting at (156, 122).
; PLAN: r0=156(x), r1=122(y), r2=86(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 122
LDI r2, 86
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
