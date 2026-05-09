; DESCRIPTION: Renders a red box of size 33x120 starting at (168, 69).
; PLAN: r0=168(x), r1=69(y), r2=33(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 69
LDI r2, 33
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
