; DESCRIPTION: Renders a black box of size 35x35 starting at (214, 131).
; PLAN: r0=214(x), r1=131(y), r2=35(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 131
LDI r2, 35
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
