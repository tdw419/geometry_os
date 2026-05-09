; DESCRIPTION: Composite: Places a red 49x80 rectangle at position (148, 170) then Renders a yellow line between points (93, 115) and (428, 124).
; PLAN: r0=148(x), r1=170(y), r2=49(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x1), r6=115(y1), r7=428(x2), r8=124(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 170
LDI r2, 49
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 115
LDI r7, 428
LDI r8, 124
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
