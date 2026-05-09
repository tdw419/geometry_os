; DESCRIPTION: Renders a red box of size 26x97 starting at (297, 31).
; PLAN: r0=297(x), r1=31(y), r2=26(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 31
LDI r2, 26
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
