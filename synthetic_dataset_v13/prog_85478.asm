; DESCRIPTION: Renders a green box of size 54x26 starting at (186, 99).
; PLAN: r0=186(x), r1=99(y), r2=54(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 99
LDI r2, 54
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
