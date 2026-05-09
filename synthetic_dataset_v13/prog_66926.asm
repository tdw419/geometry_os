; DESCRIPTION: Renders a red box of size 60x48 starting at (338, 85).
; PLAN: r0=338(x), r1=85(y), r2=60(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 85
LDI r2, 60
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
