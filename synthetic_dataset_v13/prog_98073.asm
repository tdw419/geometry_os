; DESCRIPTION: Renders a green box of size 118x27 starting at (345, 26).
; PLAN: r0=345(x), r1=26(y), r2=118(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 26
LDI r2, 118
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
