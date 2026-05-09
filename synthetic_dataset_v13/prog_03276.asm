; DESCRIPTION: Composite: Places a black circle of radius 37 at center (212, 174) then Draws a orange line from (98, 192) to (64, 5).
; PLAN: r0=212(x), r1=174(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=192(y1), r7=64(x2), r8=5(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 174
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 192
LDI r7, 64
LDI r8, 5
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
