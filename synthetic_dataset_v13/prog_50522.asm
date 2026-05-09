; DESCRIPTION: Renders a blue box of size 57x96 starting at (131, 153).
; PLAN: r0=131(x), r1=153(y), r2=57(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 153
LDI r2, 57
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
