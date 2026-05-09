; DESCRIPTION: Renders a red box of size 39x119 starting at (390, 61).
; PLAN: r0=390(x), r1=61(y), r2=39(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 61
LDI r2, 39
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
