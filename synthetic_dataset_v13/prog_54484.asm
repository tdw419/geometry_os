; DESCRIPTION: Composite: Places a red 75x110 rectangle at position (188, 78) then Places a green dot at position (496, 189).
; PLAN: r0=188(x), r1=78(y), r2=75(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=189(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 78
LDI r2, 75
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 189
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
