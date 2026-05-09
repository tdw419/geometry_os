; DESCRIPTION: Composite: Draws a purple circle centered at (79, 125) with radius 14 then Draws a cyan line from (456, 233) to (139, 168).
; PLAN: r0=79(x), r1=125(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=233(y1), r7=139(x2), r8=168(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 125
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 233
LDI r7, 139
LDI r8, 168
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
