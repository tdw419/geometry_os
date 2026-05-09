; DESCRIPTION: Renders a red box of size 114x85 starting at (124, 156).
; PLAN: r0=124(x), r1=156(y), r2=114(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 156
LDI r2, 114
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
