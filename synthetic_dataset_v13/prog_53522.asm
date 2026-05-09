; DESCRIPTION: Renders a red box of size 36x85 starting at (114, 163).
; PLAN: r0=114(x), r1=163(y), r2=36(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 163
LDI r2, 36
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
