; DESCRIPTION: Renders a red box of size 47x110 starting at (22, 79).
; PLAN: r0=22(x), r1=79(y), r2=47(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 79
LDI r2, 47
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
