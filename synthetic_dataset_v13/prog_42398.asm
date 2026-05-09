; DESCRIPTION: Renders a red box of size 112x85 starting at (39, 142).
; PLAN: r0=39(x), r1=142(y), r2=112(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 142
LDI r2, 112
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
