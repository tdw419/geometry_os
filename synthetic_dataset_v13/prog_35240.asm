; DESCRIPTION: Composite: Places a magenta circle of radius 47 at center (53, 170) then Renders a purple line between points (390, 55) and (405, 68).
; PLAN: r0=53(x), r1=170(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x1), r6=55(y1), r7=405(x2), r8=68(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 170
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 55
LDI r7, 405
LDI r8, 68
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
