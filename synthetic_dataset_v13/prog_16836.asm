; DESCRIPTION: Composite: Creates a purple circular shape at (86, 121) with radius 45 then Draws a cyan line from (174, 106) to (402, 64).
; PLAN: r0=86(x), r1=121(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=106(y1), r7=402(x2), r8=64(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 121
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 106
LDI r7, 402
LDI r8, 64
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
