; DESCRIPTION: Renders a red box of size 27x39 starting at (31, 4).
; PLAN: r0=31(x), r1=4(y), r2=27(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 4
LDI r2, 27
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
