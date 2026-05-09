; DESCRIPTION: Renders a red box of size 69x109 starting at (216, 65).
; PLAN: r0=216(x), r1=65(y), r2=69(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 65
LDI r2, 69
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
