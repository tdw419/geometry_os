; DESCRIPTION: Renders a red box of size 119x70 starting at (240, 100).
; PLAN: r0=240(x), r1=100(y), r2=119(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 100
LDI r2, 119
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
