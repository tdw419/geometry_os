; DESCRIPTION: Renders a red box of size 120x67 starting at (169, 45).
; PLAN: r0=169(x), r1=45(y), r2=120(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 45
LDI r2, 120
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
