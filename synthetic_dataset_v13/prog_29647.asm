; DESCRIPTION: Renders a red box of size 99x24 starting at (125, 19).
; PLAN: r0=125(x), r1=19(y), r2=99(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 19
LDI r2, 99
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
