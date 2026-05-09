; DESCRIPTION: Renders a red box of size 27x13 starting at (10, 99).
; PLAN: r0=10(x), r1=99(y), r2=27(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 99
LDI r2, 27
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
