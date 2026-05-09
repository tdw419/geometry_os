; DESCRIPTION: Renders a yellow box of size 13x49 starting at (43, 131).
; PLAN: r0=43(x), r1=131(y), r2=13(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 131
LDI r2, 13
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
