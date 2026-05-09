; DESCRIPTION: Renders a red box of size 120x85 starting at (45, 77).
; PLAN: r0=45(x), r1=77(y), r2=120(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 77
LDI r2, 120
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
