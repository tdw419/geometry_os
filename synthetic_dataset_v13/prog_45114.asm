; DESCRIPTION: Renders a red box of size 66x78 starting at (176, 139).
; PLAN: r0=176(x), r1=139(y), r2=66(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 139
LDI r2, 66
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
