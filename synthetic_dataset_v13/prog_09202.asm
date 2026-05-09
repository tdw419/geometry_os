; DESCRIPTION: Composite: Sets a single red pixel at (25, 144) then Places a yellow line segment connecting (497, 161) to (281, 64) then Creates a cyan circular shape at (402, 74) with radius 22.
; PLAN: r0=25(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=161(y1), r7=281(x2), r8=64(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=74(y), r12=22(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 497
LDI r6, 161
LDI r7, 281
LDI r8, 64
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 74
LDI r12, 22
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
