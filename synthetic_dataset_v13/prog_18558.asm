; DESCRIPTION: Renders a red box of size 53x49 starting at (208, 2).
; PLAN: r0=208(x), r1=2(y), r2=53(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 2
LDI r2, 53
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
