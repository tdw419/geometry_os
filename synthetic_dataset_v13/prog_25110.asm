; DESCRIPTION: Renders a red box of size 62x70 starting at (388, 35).
; PLAN: r0=388(x), r1=35(y), r2=62(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 35
LDI r2, 62
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
