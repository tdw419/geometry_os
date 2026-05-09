; DESCRIPTION: Renders a red box of size 19x48 starting at (273, 22).
; PLAN: r0=273(x), r1=22(y), r2=19(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 22
LDI r2, 19
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
