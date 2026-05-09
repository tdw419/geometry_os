; DESCRIPTION: Renders a red box of size 72x34 starting at (345, 119).
; PLAN: r0=345(x), r1=119(y), r2=72(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 119
LDI r2, 72
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
