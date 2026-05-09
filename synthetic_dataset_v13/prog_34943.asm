; DESCRIPTION: Renders a green box of size 107x65 starting at (192, 176).
; PLAN: r0=192(x), r1=176(y), r2=107(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 176
LDI r2, 107
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
