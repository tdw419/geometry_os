; DESCRIPTION: Renders a red box of size 27x81 starting at (254, 35).
; PLAN: r0=254(x), r1=35(y), r2=27(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 35
LDI r2, 27
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
