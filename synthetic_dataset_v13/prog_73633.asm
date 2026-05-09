; DESCRIPTION: Composite: Draws a blue circle centered at (301, 104) with radius 25 then Draws a yellow line from (480, 21) to (130, 172).
; PLAN: r0=301(x), r1=104(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x1), r6=21(y1), r7=130(x2), r8=172(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 104
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 21
LDI r7, 130
LDI r8, 172
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
