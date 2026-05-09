; DESCRIPTION: Renders a red box of size 11x33 starting at (58, 36).
; PLAN: r0=58(x), r1=36(y), r2=11(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 36
LDI r2, 11
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
