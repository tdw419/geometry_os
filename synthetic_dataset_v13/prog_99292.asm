; DESCRIPTION: Renders a green box of size 15x62 starting at (402, 183).
; PLAN: r0=402(x), r1=183(y), r2=15(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 183
LDI r2, 15
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
