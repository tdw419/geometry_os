; DESCRIPTION: Renders a red box of size 24x46 starting at (258, 118).
; PLAN: r0=258(x), r1=118(y), r2=24(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 118
LDI r2, 24
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
