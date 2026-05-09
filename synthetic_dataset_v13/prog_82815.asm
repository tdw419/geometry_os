; DESCRIPTION: Composite: Places a blue circle of radius 23 at center (124, 75) then Draws a black line from (407, 230) to (413, 127).
; PLAN: r0=124(x), r1=75(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x1), r6=230(y1), r7=413(x2), r8=127(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 75
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 230
LDI r7, 413
LDI r8, 127
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
