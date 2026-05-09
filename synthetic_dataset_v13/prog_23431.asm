; DESCRIPTION: Renders a red box of size 99x68 starting at (126, 39).
; PLAN: r0=126(x), r1=39(y), r2=99(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 39
LDI r2, 99
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
