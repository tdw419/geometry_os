; DESCRIPTION: Renders a red box of size 76x94 starting at (69, 8).
; PLAN: r0=69(x), r1=8(y), r2=76(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 8
LDI r2, 76
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
