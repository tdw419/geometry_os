; DESCRIPTION: Renders a red box of size 56x66 starting at (64, 102).
; PLAN: r0=64(x), r1=102(y), r2=56(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 102
LDI r2, 56
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
