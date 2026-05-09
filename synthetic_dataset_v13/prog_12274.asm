; DESCRIPTION: Renders a red box of size 89x80 starting at (180, 60).
; PLAN: r0=180(x), r1=60(y), r2=89(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 60
LDI r2, 89
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
