; DESCRIPTION: Renders a red box of size 74x74 starting at (141, 107).
; PLAN: r0=141(x), r1=107(y), r2=74(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 107
LDI r2, 74
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
