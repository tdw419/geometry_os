; DESCRIPTION: Renders a red box of size 66x116 starting at (226, 52).
; PLAN: r0=226(x), r1=52(y), r2=66(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 52
LDI r2, 66
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
