; DESCRIPTION: Renders a red box of size 52x91 starting at (312, 37).
; PLAN: r0=312(x), r1=37(y), r2=52(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 37
LDI r2, 52
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
