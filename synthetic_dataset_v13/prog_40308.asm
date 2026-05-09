; DESCRIPTION: Renders a red box of size 54x85 starting at (93, 19).
; PLAN: r0=93(x), r1=19(y), r2=54(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 19
LDI r2, 54
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
