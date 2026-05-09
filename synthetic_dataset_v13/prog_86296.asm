; DESCRIPTION: Renders a green box of size 90x40 starting at (201, 200).
; PLAN: r0=201(x), r1=200(y), r2=90(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 200
LDI r2, 90
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
