; DESCRIPTION: Renders a red box of size 90x89 starting at (305, 49).
; PLAN: r0=305(x), r1=49(y), r2=90(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 49
LDI r2, 90
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
