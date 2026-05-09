; DESCRIPTION: Composite: Places a yellow circle of radius 58 at center (314, 103) then Draws a orange line from (331, 189) to (292, 66).
; PLAN: r0=314(x), r1=103(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=189(y1), r7=292(x2), r8=66(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 103
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 189
LDI r7, 292
LDI r8, 66
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
