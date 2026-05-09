; DESCRIPTION: Composite: Places a purple line segment connecting (8, 97) to (115, 240) then Creates a cyan circular shape at (289, 206) with radius 44.
; PLAN: r0=8(x1), r1=97(y1), r2=115(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=206(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 97
LDI r2, 115
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 206
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
