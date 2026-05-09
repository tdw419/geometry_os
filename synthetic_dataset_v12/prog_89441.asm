; DESCRIPTION: Renders a red box of size 95x11 starting at (86, 181).
; PLAN: r0=86(x), r1=181(y), r2=95(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 181
LDI r2, 95
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
