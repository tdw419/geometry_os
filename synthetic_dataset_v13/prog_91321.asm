; DESCRIPTION: Renders a red box of size 49x12 starting at (355, 13).
; PLAN: r0=355(x), r1=13(y), r2=49(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 13
LDI r2, 49
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
