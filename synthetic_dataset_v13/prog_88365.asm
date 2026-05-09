; DESCRIPTION: Composite: Places a red 83x41 rectangle at position (147, 211) then Places a black line segment connecting (193, 200) to (88, 17).
; PLAN: r0=147(x), r1=211(y), r2=83(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x1), r6=200(y1), r7=88(x2), r8=17(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 211
LDI r2, 83
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 200
LDI r7, 88
LDI r8, 17
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
