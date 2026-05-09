; DESCRIPTION: Renders a red box of size 110x37 starting at (90, 137).
; PLAN: r0=90(x), r1=137(y), r2=110(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 137
LDI r2, 110
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
