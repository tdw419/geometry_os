; DESCRIPTION: Composite: Places a green line segment connecting (509, 99) to (257, 176) then Renders a purple box of size 56x55 starting at (402, 101).
; PLAN: r0=509(x1), r1=99(y1), r2=257(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=101(y), r7=56(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 99
LDI r2, 257
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 101
LDI r7, 56
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
