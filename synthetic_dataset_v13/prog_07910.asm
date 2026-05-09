; DESCRIPTION: Renders a red box of size 39x110 starting at (389, 2).
; PLAN: r0=389(x), r1=2(y), r2=39(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 2
LDI r2, 39
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
