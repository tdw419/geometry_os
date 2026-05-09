; DESCRIPTION: Renders a red box of size 39x54 starting at (26, 0).
; PLAN: r0=26(x), r1=0(y), r2=39(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 0
LDI r2, 39
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
