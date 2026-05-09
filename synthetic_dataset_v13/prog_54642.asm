; DESCRIPTION: Renders a green box of size 97x107 starting at (224, 13).
; PLAN: r0=224(x), r1=13(y), r2=97(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 13
LDI r2, 97
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
