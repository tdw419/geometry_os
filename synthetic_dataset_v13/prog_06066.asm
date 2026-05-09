; DESCRIPTION: Composite: Places a red line segment connecting (328, 41) to (205, 15) then Places a purple circle of radius 54 at center (303, 102).
; PLAN: r0=328(x1), r1=41(y1), r2=205(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=102(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 41
LDI r2, 205
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 102
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
