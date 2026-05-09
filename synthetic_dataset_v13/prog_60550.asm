; DESCRIPTION: Composite: Places a magenta circle of radius 63 at center (440, 180) then Draws a purple line from (385, 83) to (412, 160).
; PLAN: r0=440(x), r1=180(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=83(y1), r7=412(x2), r8=160(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 180
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 83
LDI r7, 412
LDI r8, 160
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
