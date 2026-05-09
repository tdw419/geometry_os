; DESCRIPTION: Renders a red box of size 110x36 starting at (300, 34).
; PLAN: r0=300(x), r1=34(y), r2=110(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 34
LDI r2, 110
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
