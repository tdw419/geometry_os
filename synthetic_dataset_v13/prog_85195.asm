; DESCRIPTION: Renders a red box of size 109x47 starting at (135, 114).
; PLAN: r0=135(x), r1=114(y), r2=109(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 114
LDI r2, 109
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
