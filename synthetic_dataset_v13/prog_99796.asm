; DESCRIPTION: Renders a red box of size 66x100 starting at (5, 33).
; PLAN: r0=5(x), r1=33(y), r2=66(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 33
LDI r2, 66
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
