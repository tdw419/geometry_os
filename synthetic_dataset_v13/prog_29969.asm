; DESCRIPTION: Renders a green box of size 49x24 starting at (23, 160).
; PLAN: r0=23(x), r1=160(y), r2=49(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 160
LDI r2, 49
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
