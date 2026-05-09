; DESCRIPTION: Renders a red box of size 82x72 starting at (131, 72).
; PLAN: r0=131(x), r1=72(y), r2=82(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 72
LDI r2, 82
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
