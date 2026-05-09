; DESCRIPTION: Renders a green box of size 94x105 starting at (201, 23).
; PLAN: r0=201(x), r1=23(y), r2=94(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 23
LDI r2, 94
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
