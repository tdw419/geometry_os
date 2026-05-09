; DESCRIPTION: Renders a green box of size 115x87 starting at (37, 24).
; PLAN: r0=37(x), r1=24(y), r2=115(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 24
LDI r2, 115
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
