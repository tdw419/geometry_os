; DESCRIPTION: Composite: Places a red line segment connecting (416, 217) to (260, 117) then Places a yellow circle of radius 29 at center (75, 163).
; PLAN: r0=416(x1), r1=217(y1), r2=260(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=163(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 416
LDI r1, 217
LDI r2, 260
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 163
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
