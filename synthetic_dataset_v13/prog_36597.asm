; DESCRIPTION: Renders a red box of size 119x33 starting at (308, 102).
; PLAN: r0=308(x), r1=102(y), r2=119(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 102
LDI r2, 119
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
