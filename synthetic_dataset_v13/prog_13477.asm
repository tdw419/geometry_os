; DESCRIPTION: Renders a red box of size 38x58 starting at (61, 145).
; PLAN: r0=61(x), r1=145(y), r2=38(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 145
LDI r2, 38
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
