; DESCRIPTION: Renders a red box of size 117x34 starting at (181, 161).
; PLAN: r0=181(x), r1=161(y), r2=117(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 161
LDI r2, 117
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
