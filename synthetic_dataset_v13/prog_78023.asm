; DESCRIPTION: Renders a red box of size 12x69 starting at (205, 131).
; PLAN: r0=205(x), r1=131(y), r2=12(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 131
LDI r2, 12
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
