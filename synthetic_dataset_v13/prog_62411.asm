; DESCRIPTION: Renders a red box of size 89x109 starting at (110, 92).
; PLAN: r0=110(x), r1=92(y), r2=89(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 92
LDI r2, 89
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
