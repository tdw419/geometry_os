; DESCRIPTION: Composite: Creates a purple circular shape at (196, 77) with radius 47 then Renders a cyan line between points (24, 254) and (452, 249).
; PLAN: r0=196(x), r1=77(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x1), r6=254(y1), r7=452(x2), r8=249(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 77
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 254
LDI r7, 452
LDI r8, 249
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
