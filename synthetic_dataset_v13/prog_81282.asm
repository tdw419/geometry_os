; DESCRIPTION: Renders a red box of size 61x107 starting at (191, 25).
; PLAN: r0=191(x), r1=25(y), r2=61(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 25
LDI r2, 61
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
