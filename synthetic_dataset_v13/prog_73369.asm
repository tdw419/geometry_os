; DESCRIPTION: Renders a red box of size 94x71 starting at (121, 162).
; PLAN: r0=121(x), r1=162(y), r2=94(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 162
LDI r2, 94
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
