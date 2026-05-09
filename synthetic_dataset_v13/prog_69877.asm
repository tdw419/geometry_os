; DESCRIPTION: Renders a red box of size 72x99 starting at (339, 40).
; PLAN: r0=339(x), r1=40(y), r2=72(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 40
LDI r2, 72
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
