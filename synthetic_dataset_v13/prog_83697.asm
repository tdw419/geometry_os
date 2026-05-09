; DESCRIPTION: Renders a red box of size 91x49 starting at (420, 60).
; PLAN: r0=420(x), r1=60(y), r2=91(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 60
LDI r2, 91
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
