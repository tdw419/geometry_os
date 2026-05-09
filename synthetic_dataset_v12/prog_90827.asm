; DESCRIPTION: Renders a blue box of size 97x87 starting at (27, 99).
; PLAN: r0=27(x), r1=99(y), r2=97(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 99
LDI r2, 97
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
