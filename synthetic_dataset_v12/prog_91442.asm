; DESCRIPTION: Renders a red box of size 86x112 starting at (73, 81).
; PLAN: r0=73(x), r1=81(y), r2=86(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 81
LDI r2, 86
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
