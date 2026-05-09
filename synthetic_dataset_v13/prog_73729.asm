; DESCRIPTION: Renders a red box of size 59x85 starting at (437, 163).
; PLAN: r0=437(x), r1=163(y), r2=59(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 163
LDI r2, 59
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
