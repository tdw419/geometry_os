; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (66, 114) then Renders a orange line between points (482, 229) and (465, 101).
; PLAN: r0=66(x), r1=114(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x1), r6=229(y1), r7=465(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 114
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 229
LDI r7, 465
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
