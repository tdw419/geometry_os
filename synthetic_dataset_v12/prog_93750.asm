; DESCRIPTION: Renders a red box of size 111x47 starting at (339, 121).
; PLAN: r0=339(x), r1=121(y), r2=111(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 121
LDI r2, 111
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
