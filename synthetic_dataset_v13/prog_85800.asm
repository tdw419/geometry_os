; DESCRIPTION: Renders a red box of size 105x65 starting at (249, 22).
; PLAN: r0=249(x), r1=22(y), r2=105(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 22
LDI r2, 105
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
