; DESCRIPTION: Renders a red box of size 56x19 starting at (141, 14).
; PLAN: r0=141(x), r1=14(y), r2=56(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 14
LDI r2, 56
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
