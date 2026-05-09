; DESCRIPTION: Composite: Draws a yellow circle centered at (276, 99) with radius 10 then Draws a orange line from (464, 196) to (197, 235).
; PLAN: r0=276(x), r1=99(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x1), r6=196(y1), r7=197(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 99
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 196
LDI r7, 197
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
