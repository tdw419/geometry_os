; DESCRIPTION: Renders a red box of size 90x27 starting at (121, 102).
; PLAN: r0=121(x), r1=102(y), r2=90(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 102
LDI r2, 90
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
