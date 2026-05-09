; DESCRIPTION: Renders a red box of size 105x65 starting at (21, 106).
; PLAN: r0=21(x), r1=106(y), r2=105(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 106
LDI r2, 105
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
