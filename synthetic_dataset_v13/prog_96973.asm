; DESCRIPTION: Composite: Places a green 45x93 rectangle at position (51, 121) then Renders a black line between points (145, 192) and (321, 121).
; PLAN: r0=51(x), r1=121(y), r2=45(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x1), r6=192(y1), r7=321(x2), r8=121(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 121
LDI r2, 45
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 192
LDI r7, 321
LDI r8, 121
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
