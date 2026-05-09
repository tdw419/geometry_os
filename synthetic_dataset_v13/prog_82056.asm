; DESCRIPTION: Renders a red box of size 48x34 starting at (274, 141).
; PLAN: r0=274(x), r1=141(y), r2=48(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 141
LDI r2, 48
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
