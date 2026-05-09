; DESCRIPTION: Renders a red box of size 100x52 starting at (177, 32).
; PLAN: r0=177(x), r1=32(y), r2=100(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 32
LDI r2, 100
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
