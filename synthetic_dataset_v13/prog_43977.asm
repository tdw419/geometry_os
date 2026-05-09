; DESCRIPTION: Renders a red box of size 85x34 starting at (6, 180).
; PLAN: r0=6(x), r1=180(y), r2=85(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 180
LDI r2, 85
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
