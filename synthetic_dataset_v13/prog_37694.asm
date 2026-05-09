; DESCRIPTION: Renders a red box of size 29x13 starting at (4, 26).
; PLAN: r0=4(x), r1=26(y), r2=29(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 26
LDI r2, 29
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
