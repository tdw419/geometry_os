; DESCRIPTION: Renders a red box of size 38x103 starting at (388, 100).
; PLAN: r0=388(x), r1=100(y), r2=38(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 100
LDI r2, 38
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
