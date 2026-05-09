; DESCRIPTION: Renders a red box of size 24x34 starting at (466, 159).
; PLAN: r0=466(x), r1=159(y), r2=24(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 159
LDI r2, 24
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
