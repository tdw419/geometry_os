; DESCRIPTION: Renders a red box of size 119x58 starting at (91, 30).
; PLAN: r0=91(x), r1=30(y), r2=119(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 30
LDI r2, 119
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
