; DESCRIPTION: Renders a yellow box of size 86x25 starting at (53, 158).
; PLAN: r0=53(x), r1=158(y), r2=86(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 158
LDI r2, 86
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
