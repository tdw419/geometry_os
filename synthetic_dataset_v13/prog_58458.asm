; DESCRIPTION: Composite: Creates a orange circular shape at (321, 179) with radius 10 then Draws a blue line from (32, 119) to (75, 5).
; PLAN: r0=321(x), r1=179(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=119(y1), r7=75(x2), r8=5(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 179
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 119
LDI r7, 75
LDI r8, 5
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
