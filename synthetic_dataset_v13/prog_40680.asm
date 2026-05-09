; DESCRIPTION: Renders a red box of size 74x111 starting at (353, 141).
; PLAN: r0=353(x), r1=141(y), r2=74(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 141
LDI r2, 74
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
