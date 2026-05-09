; DESCRIPTION: Composite: Draws a yellow circle centered at (258, 207) with radius 33 then Draws a blue line from (450, 211) to (301, 4).
; PLAN: r0=258(x), r1=207(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=211(y1), r7=301(x2), r8=4(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 207
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 211
LDI r7, 301
LDI r8, 4
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
