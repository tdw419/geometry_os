; DESCRIPTION: Renders a red box of size 26x80 starting at (197, 97).
; PLAN: r0=197(x), r1=97(y), r2=26(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 97
LDI r2, 26
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
