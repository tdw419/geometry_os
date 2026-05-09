; DESCRIPTION: Composite: Places a yellow circle of radius 58 at center (186, 120) then Draws a yellow line from (324, 54) to (25, 70).
; PLAN: r0=186(x), r1=120(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x1), r6=54(y1), r7=25(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 120
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 54
LDI r7, 25
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
