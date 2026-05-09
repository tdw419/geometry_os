; DESCRIPTION: Renders a green box of size 58x68 starting at (270, 128).
; PLAN: r0=270(x), r1=128(y), r2=58(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 128
LDI r2, 58
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
