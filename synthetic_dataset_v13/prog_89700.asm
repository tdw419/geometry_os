; DESCRIPTION: Renders a red box of size 96x110 starting at (70, 105).
; PLAN: r0=70(x), r1=105(y), r2=96(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 105
LDI r2, 96
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
