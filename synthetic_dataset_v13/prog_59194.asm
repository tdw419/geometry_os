; DESCRIPTION: Renders a green box of size 92x49 starting at (131, 106).
; PLAN: r0=131(x), r1=106(y), r2=92(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 106
LDI r2, 92
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
