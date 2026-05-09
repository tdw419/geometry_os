; DESCRIPTION: Renders a yellow box of size 74x97 starting at (182, 135).
; PLAN: r0=182(x), r1=135(y), r2=74(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 135
LDI r2, 74
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
