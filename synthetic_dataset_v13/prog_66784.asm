; DESCRIPTION: Composite: Places a purple circle of radius 30 at center (473, 49) then Renders a purple line between points (333, 29) and (132, 108).
; PLAN: r0=473(x), r1=49(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x1), r6=29(y1), r7=132(x2), r8=108(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 49
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 29
LDI r7, 132
LDI r8, 108
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
