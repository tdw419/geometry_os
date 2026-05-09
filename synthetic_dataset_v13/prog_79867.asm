; DESCRIPTION: Renders a red box of size 39x96 starting at (216, 27).
; PLAN: r0=216(x), r1=27(y), r2=39(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 27
LDI r2, 39
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
