; DESCRIPTION: Renders a red box of size 108x60 starting at (112, 114).
; PLAN: r0=112(x), r1=114(y), r2=108(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 114
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
