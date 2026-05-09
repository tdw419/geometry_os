; DESCRIPTION: Renders a red box of size 105x12 starting at (174, 34).
; PLAN: r0=174(x), r1=34(y), r2=105(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 34
LDI r2, 105
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
