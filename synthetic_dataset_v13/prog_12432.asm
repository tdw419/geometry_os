; DESCRIPTION: Renders a green box of size 37x105 starting at (427, 16).
; PLAN: r0=427(x), r1=16(y), r2=37(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 16
LDI r2, 37
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
