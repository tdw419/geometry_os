; DESCRIPTION: Renders a red box of size 112x83 starting at (27, 78).
; PLAN: r0=27(x), r1=78(y), r2=112(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 78
LDI r2, 112
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
