; DESCRIPTION: Renders a red box of size 22x78 starting at (449, 90).
; PLAN: r0=449(x), r1=90(y), r2=22(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 90
LDI r2, 22
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
