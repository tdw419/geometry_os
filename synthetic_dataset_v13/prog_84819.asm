; DESCRIPTION: Renders a red box of size 100x47 starting at (8, 120).
; PLAN: r0=8(x), r1=120(y), r2=100(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 120
LDI r2, 100
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
