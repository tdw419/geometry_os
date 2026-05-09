; DESCRIPTION: Renders a green box of size 21x13 starting at (110, 200).
; PLAN: r0=110(x), r1=200(y), r2=21(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 200
LDI r2, 21
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
