; DESCRIPTION: Renders a green box of size 32x37 starting at (374, 119).
; PLAN: r0=374(x), r1=119(y), r2=32(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 119
LDI r2, 32
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
