; DESCRIPTION: Renders a red box of size 97x117 starting at (213, 8).
; PLAN: r0=213(x), r1=8(y), r2=97(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 8
LDI r2, 97
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
