; DESCRIPTION: Renders a red box of size 91x117 starting at (232, 35).
; PLAN: r0=232(x), r1=35(y), r2=91(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 35
LDI r2, 91
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
