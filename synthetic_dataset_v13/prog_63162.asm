; DESCRIPTION: Renders a red box of size 89x15 starting at (170, 177).
; PLAN: r0=170(x), r1=177(y), r2=89(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 177
LDI r2, 89
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
