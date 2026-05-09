; DESCRIPTION: Renders a red box of size 108x17 starting at (162, 87).
; PLAN: r0=162(x), r1=87(y), r2=108(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 87
LDI r2, 108
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
