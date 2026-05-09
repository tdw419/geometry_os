; DESCRIPTION: Renders a red box of size 35x99 starting at (270, 85).
; PLAN: r0=270(x), r1=85(y), r2=35(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 85
LDI r2, 35
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
