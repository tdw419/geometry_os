; DESCRIPTION: Composite: Draws a red rectangle at (171, 2) with width 48 and height 54 then Places a yellow line segment connecting (287, 211) to (89, 186).
; PLAN: r0=171(x), r1=2(y), r2=48(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=211(y1), r7=89(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 2
LDI r2, 48
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 211
LDI r7, 89
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
