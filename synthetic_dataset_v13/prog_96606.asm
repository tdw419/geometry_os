; DESCRIPTION: Renders a red box of size 24x26 starting at (485, 183).
; PLAN: r0=485(x), r1=183(y), r2=24(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 183
LDI r2, 24
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
