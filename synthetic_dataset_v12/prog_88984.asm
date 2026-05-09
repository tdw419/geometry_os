; DESCRIPTION: Renders a red box of size 45x30 starting at (285, 184).
; PLAN: r0=285(x), r1=184(y), r2=45(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 184
LDI r2, 45
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
