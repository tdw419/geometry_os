; DESCRIPTION: Renders a red box of size 25x37 starting at (114, 31).
; PLAN: r0=114(x), r1=31(y), r2=25(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 31
LDI r2, 25
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
