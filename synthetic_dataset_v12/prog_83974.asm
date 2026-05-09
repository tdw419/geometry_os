; DESCRIPTION: Renders a green box of size 81x117 starting at (426, 30).
; PLAN: r0=426(x), r1=30(y), r2=81(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 30
LDI r2, 81
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
