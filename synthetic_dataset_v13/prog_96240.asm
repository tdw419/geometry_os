; DESCRIPTION: Renders a green box of size 58x83 starting at (40, 118).
; PLAN: r0=40(x), r1=118(y), r2=58(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 118
LDI r2, 58
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
