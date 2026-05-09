; DESCRIPTION: Composite: Places a white line segment connecting (351, 102) to (240, 94) then Creates a cyan circular shape at (64, 63) with radius 42.
; PLAN: r0=351(x1), r1=102(y1), r2=240(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=63(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 351
LDI r1, 102
LDI r2, 240
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 63
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
