; DESCRIPTION: Renders a red box of size 45x67 starting at (432, 64).
; PLAN: r0=432(x), r1=64(y), r2=45(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 64
LDI r2, 45
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
