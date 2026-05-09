; DESCRIPTION: Renders a red box of size 109x10 starting at (324, 131).
; PLAN: r0=324(x), r1=131(y), r2=109(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 131
LDI r2, 109
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
