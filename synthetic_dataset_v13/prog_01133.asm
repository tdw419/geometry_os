; DESCRIPTION: Composite: Places a yellow line segment connecting (472, 93) to (332, 232) then Places a red 57x14 rectangle at position (155, 165).
; PLAN: r0=472(x1), r1=93(y1), r2=332(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=165(y), r7=57(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 93
LDI r2, 332
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 165
LDI r7, 57
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
