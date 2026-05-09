; DESCRIPTION: Composite: Places a yellow circle of radius 22 at center (335, 71) then Places a yellow line segment connecting (111, 231) to (105, 101) then Places a red dot at position (80, 47).
; PLAN: r0=335(x), r1=71(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x1), r6=231(y1), r7=105(x2), r8=101(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=47(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 71
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 231
LDI r7, 105
LDI r8, 101
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 47
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
