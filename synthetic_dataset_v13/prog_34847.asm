; DESCRIPTION: Renders a red box of size 19x64 starting at (313, 102).
; PLAN: r0=313(x), r1=102(y), r2=19(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 102
LDI r2, 19
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
