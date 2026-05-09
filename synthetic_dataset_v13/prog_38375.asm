; DESCRIPTION: Renders a red box of size 31x81 starting at (311, 28).
; PLAN: r0=311(x), r1=28(y), r2=31(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 28
LDI r2, 31
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
