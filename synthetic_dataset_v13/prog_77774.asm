; DESCRIPTION: Renders a black box of size 45x100 starting at (338, 131).
; PLAN: r0=338(x), r1=131(y), r2=45(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 131
LDI r2, 45
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
