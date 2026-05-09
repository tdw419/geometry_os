; DESCRIPTION: Renders a red box of size 36x80 starting at (471, 97).
; PLAN: r0=471(x), r1=97(y), r2=36(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 97
LDI r2, 36
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
