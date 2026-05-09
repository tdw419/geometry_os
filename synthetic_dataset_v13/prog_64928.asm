; DESCRIPTION: Composite: Places a cyan line segment connecting (268, 29) to (417, 173) then Creates a purple circular shape at (313, 75) with radius 47.
; PLAN: r0=268(x1), r1=29(y1), r2=417(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=75(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 29
LDI r2, 417
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 75
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
