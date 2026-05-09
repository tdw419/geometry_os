; DESCRIPTION: Renders a red box of size 53x100 starting at (131, 47).
; PLAN: r0=131(x), r1=47(y), r2=53(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 47
LDI r2, 53
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
