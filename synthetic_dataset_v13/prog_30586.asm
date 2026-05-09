; DESCRIPTION: Renders a green box of size 37x49 starting at (374, 30).
; PLAN: r0=374(x), r1=30(y), r2=37(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 30
LDI r2, 37
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
