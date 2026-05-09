; DESCRIPTION: Renders a red box of size 85x27 starting at (238, 112).
; PLAN: r0=238(x), r1=112(y), r2=85(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 112
LDI r2, 85
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
