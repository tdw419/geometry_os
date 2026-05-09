; DESCRIPTION: Renders a red box of size 74x98 starting at (393, 35).
; PLAN: r0=393(x), r1=35(y), r2=74(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 35
LDI r2, 74
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
