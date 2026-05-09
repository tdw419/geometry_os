; DESCRIPTION: Renders a red box of size 78x54 starting at (420, 4).
; PLAN: r0=420(x), r1=4(y), r2=78(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 4
LDI r2, 78
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
