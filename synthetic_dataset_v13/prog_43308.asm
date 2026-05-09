; DESCRIPTION: Renders a red box of size 43x62 starting at (260, 139).
; PLAN: r0=260(x), r1=139(y), r2=43(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 139
LDI r2, 43
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
