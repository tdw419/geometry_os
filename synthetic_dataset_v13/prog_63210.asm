; DESCRIPTION: Renders a red box of size 92x118 starting at (173, 45).
; PLAN: r0=173(x), r1=45(y), r2=92(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 45
LDI r2, 92
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
