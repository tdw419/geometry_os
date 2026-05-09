; DESCRIPTION: Renders a green box of size 115x45 starting at (192, 156).
; PLAN: r0=192(x), r1=156(y), r2=115(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 156
LDI r2, 115
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
