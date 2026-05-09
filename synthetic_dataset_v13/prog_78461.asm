; DESCRIPTION: Renders a red box of size 71x45 starting at (102, 144).
; PLAN: r0=102(x), r1=144(y), r2=71(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 144
LDI r2, 71
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
