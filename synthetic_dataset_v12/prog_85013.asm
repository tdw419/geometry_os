; DESCRIPTION: Renders a red box of size 31x10 starting at (222, 50).
; PLAN: r0=222(x), r1=50(y), r2=31(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 50
LDI r2, 31
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
