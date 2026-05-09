; DESCRIPTION: Renders a red box of size 101x93 starting at (213, 34).
; PLAN: r0=213(x), r1=34(y), r2=101(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 34
LDI r2, 101
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
