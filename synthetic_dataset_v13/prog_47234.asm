; DESCRIPTION: Renders a red box of size 22x49 starting at (296, 158).
; PLAN: r0=296(x), r1=158(y), r2=22(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 158
LDI r2, 22
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
