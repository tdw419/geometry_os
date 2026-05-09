; DESCRIPTION: Renders a red box of size 37x52 starting at (457, 109).
; PLAN: r0=457(x), r1=109(y), r2=37(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 109
LDI r2, 37
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
