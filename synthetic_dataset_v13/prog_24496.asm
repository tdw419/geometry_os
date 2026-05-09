; DESCRIPTION: Renders a red box of size 87x20 starting at (261, 180).
; PLAN: r0=261(x), r1=180(y), r2=87(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 180
LDI r2, 87
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
