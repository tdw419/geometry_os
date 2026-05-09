; DESCRIPTION: Renders a red box of size 23x10 starting at (134, 186).
; PLAN: r0=134(x), r1=186(y), r2=23(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 186
LDI r2, 23
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
