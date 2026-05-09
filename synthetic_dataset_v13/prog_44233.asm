; DESCRIPTION: Composite: Places a blue circle of radius 51 at center (78, 144) then Draws a yellow line from (448, 103) to (279, 108).
; PLAN: r0=78(x), r1=144(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x1), r6=103(y1), r7=279(x2), r8=108(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 144
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 103
LDI r7, 279
LDI r8, 108
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
