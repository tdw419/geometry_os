; DESCRIPTION: Renders a red box of size 61x22 starting at (361, 184).
; PLAN: r0=361(x), r1=184(y), r2=61(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 184
LDI r2, 61
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
