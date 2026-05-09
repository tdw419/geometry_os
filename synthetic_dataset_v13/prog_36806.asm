; DESCRIPTION: Renders a red box of size 48x23 starting at (47, 35).
; PLAN: r0=47(x), r1=35(y), r2=48(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 35
LDI r2, 48
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
