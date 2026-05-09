; DESCRIPTION: Renders a red box of size 89x117 starting at (311, 89).
; PLAN: r0=311(x), r1=89(y), r2=89(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 89
LDI r2, 89
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
