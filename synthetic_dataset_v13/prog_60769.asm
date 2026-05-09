; DESCRIPTION: Renders a green box of size 94x73 starting at (402, 26).
; PLAN: r0=402(x), r1=26(y), r2=94(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 26
LDI r2, 94
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
