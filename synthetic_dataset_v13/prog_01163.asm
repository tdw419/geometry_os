; DESCRIPTION: Renders a blue box of size 38x15 starting at (131, 100).
; PLAN: r0=131(x), r1=100(y), r2=38(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 100
LDI r2, 38
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
