; DESCRIPTION: Renders a green box of size 54x101 starting at (27, 140).
; PLAN: r0=27(x), r1=140(y), r2=54(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 140
LDI r2, 54
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
