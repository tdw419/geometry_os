; DESCRIPTION: Renders a red box of size 89x31 starting at (237, 162).
; PLAN: r0=237(x), r1=162(y), r2=89(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 162
LDI r2, 89
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
