; DESCRIPTION: Renders a red box of size 89x35 starting at (259, 127).
; PLAN: r0=259(x), r1=127(y), r2=89(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 127
LDI r2, 89
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
