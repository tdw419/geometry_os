; DESCRIPTION: Composite: Places a red circle of radius 54 at center (433, 139) then Draws a orange line from (93, 243) to (162, 65).
; PLAN: r0=433(x), r1=139(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x1), r6=243(y1), r7=162(x2), r8=65(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 139
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 243
LDI r7, 162
LDI r8, 65
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
