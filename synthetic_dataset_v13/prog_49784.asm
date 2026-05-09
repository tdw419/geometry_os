; DESCRIPTION: Renders a green box of size 64x37 starting at (35, 46).
; PLAN: r0=35(x), r1=46(y), r2=64(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 46
LDI r2, 64
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
