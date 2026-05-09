; DESCRIPTION: Composite: Renders a purple line between points (201, 42) and (133, 141) then Draws a cyan circle centered at (281, 105) with radius 32.
; PLAN: r0=201(x1), r1=42(y1), r2=133(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=105(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 42
LDI r2, 133
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 105
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
