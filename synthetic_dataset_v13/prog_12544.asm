; DESCRIPTION: Renders a red box of size 89x18 starting at (283, 13).
; PLAN: r0=283(x), r1=13(y), r2=89(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 13
LDI r2, 89
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
