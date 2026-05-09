; DESCRIPTION: Renders a red box of size 78x76 starting at (147, 130).
; PLAN: r0=147(x), r1=130(y), r2=78(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 130
LDI r2, 78
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
