; DESCRIPTION: Renders a red box of size 31x36 starting at (229, 179).
; PLAN: r0=229(x), r1=179(y), r2=31(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 179
LDI r2, 31
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
