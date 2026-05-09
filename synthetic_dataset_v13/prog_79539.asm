; DESCRIPTION: Composite: Renders a green line between points (396, 123) and (25, 51) then Places a yellow 38x15 rectangle at position (129, 157).
; PLAN: r0=396(x1), r1=123(y1), r2=25(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=157(y), r7=38(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 123
LDI r2, 25
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 157
LDI r7, 38
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
