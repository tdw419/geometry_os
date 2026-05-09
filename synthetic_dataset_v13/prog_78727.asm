; DESCRIPTION: Renders a green box of size 118x14 starting at (326, 87).
; PLAN: r0=326(x), r1=87(y), r2=118(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 87
LDI r2, 118
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
