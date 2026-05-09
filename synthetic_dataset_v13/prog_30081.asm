; DESCRIPTION: Renders a red box of size 31x59 starting at (317, 72).
; PLAN: r0=317(x), r1=72(y), r2=31(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 72
LDI r2, 31
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
