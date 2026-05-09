; DESCRIPTION: Renders a red box of size 33x69 starting at (80, 141).
; PLAN: r0=80(x), r1=141(y), r2=33(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 141
LDI r2, 33
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
