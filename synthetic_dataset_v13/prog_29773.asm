; DESCRIPTION: Renders a red box of size 66x58 starting at (247, 149).
; PLAN: r0=247(x), r1=149(y), r2=66(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 149
LDI r2, 66
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
