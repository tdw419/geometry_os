; DESCRIPTION: Renders a red box of size 99x69 starting at (190, 61).
; PLAN: r0=190(x), r1=61(y), r2=99(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 61
LDI r2, 99
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
