; DESCRIPTION: Composite: Places a purple circle of radius 39 at center (324, 99) then Places a cyan line segment connecting (177, 162) to (89, 198).
; PLAN: r0=324(x), r1=99(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x1), r6=162(y1), r7=89(x2), r8=198(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 99
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 162
LDI r7, 89
LDI r8, 198
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
