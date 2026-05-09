; DESCRIPTION: Renders a green box of size 55x101 starting at (261, 131).
; PLAN: r0=261(x), r1=131(y), r2=55(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 131
LDI r2, 55
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
