; DESCRIPTION: Renders a red box of size 17x70 starting at (74, 130).
; PLAN: r0=74(x), r1=130(y), r2=17(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 130
LDI r2, 17
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
