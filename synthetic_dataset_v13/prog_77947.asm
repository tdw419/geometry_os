; DESCRIPTION: Composite: Places a black 95x91 rectangle at position (13, 113) then Renders a yellow line between points (77, 118) and (361, 246).
; PLAN: r0=13(x), r1=113(y), r2=95(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=118(y1), r7=361(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 113
LDI r2, 95
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 118
LDI r7, 361
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
