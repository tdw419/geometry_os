; DESCRIPTION: Composite: Places a yellow circle of radius 74 at center (279, 99) then Places a blue line segment connecting (7, 205) to (114, 249).
; PLAN: r0=279(x), r1=99(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x1), r6=205(y1), r7=114(x2), r8=249(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 99
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 205
LDI r7, 114
LDI r8, 249
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
