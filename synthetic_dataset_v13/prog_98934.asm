; DESCRIPTION: Renders a red box of size 110x80 starting at (112, 39).
; PLAN: r0=112(x), r1=39(y), r2=110(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 39
LDI r2, 110
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
