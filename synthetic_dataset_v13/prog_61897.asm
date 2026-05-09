; DESCRIPTION: Renders a red box of size 107x34 starting at (105, 126).
; PLAN: r0=105(x), r1=126(y), r2=107(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 126
LDI r2, 107
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
