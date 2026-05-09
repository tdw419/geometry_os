; DESCRIPTION: Composite: Draws a purple circle centered at (463, 184) with radius 46 then Draws a cyan line from (22, 165) to (349, 114).
; PLAN: r0=463(x), r1=184(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x1), r6=165(y1), r7=349(x2), r8=114(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 184
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 165
LDI r7, 349
LDI r8, 114
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
