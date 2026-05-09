; DESCRIPTION: Renders a red box of size 117x99 starting at (95, 66).
; PLAN: r0=95(x), r1=66(y), r2=117(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 66
LDI r2, 117
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
